require 'dp'
require 'torchx' -- for paths.indexdir
local M = {}

function M.incomingImages(dataPath, imgSize)
   -- 1. load imageFiles into images and target Tensors
   local imageFiles = paths.indexdir(dataPath, 'jpg' ) 

   local size = imageFiles:size() 
   local images = torch.FloatTensor(size, 3, imgSize , imgSize)
   local filenames={}

   for i=1,size do
     filename = imageFiles:filename(i)
     table.insert( filenames, filename )
      local img = image.load( filename )
      --images[i]:copy(image.scale( img, imgSize, imgSize ))  -- for resizing
      images[i]:copy( img )
      collectgarbage()
   end
   --
   -- 4. wrap datasets into datasource

   return images, filenames 
end

return M
