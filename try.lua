require 'dp'
require 'torchx' -- for paths.indexdir
local M = {}

function M.incomingImages(dataPath, imgSize)
  local debugger = require('fb.debugger')
  debugger.enter()
   -- 1. load imageFiles into images and target Tensors
   local imageFiles = paths.indexdir(dataPath, 'jpg' ) 

   local size = imageFiles:size() 
   local images = torch.FloatTensor(size, 3, imgsize , imgsize)

   for i=1,size do
      local img = image.load(imageFiles:filename(i))
      images[i]:copy(img:scale( imgSize, imgSize ))
      collectgarbage()
   end
   --
   -- 4. wrap datasets into datasource

   return images
end

im=M.incomingImages('/securityCamera/incoming/', 192)
