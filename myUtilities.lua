require('lfs')

local M = {}
function M.getFile(dir, pattern )  --  return the list of file that match this pattern
  rv={}
  --scan the directory's files
  for file in lfs.dir(dir) do
      --> look for any files ending with .jpg
      if file:match( pattern ) then
        rv[ #rv + 1 ] = dir .. '/' .. file
      end
  end
  return(rv)
end 


function M.unique(input)
  local b = {}
  for i,v in pairs( input ) do
     b[ v ] = true
   end
  local out = {}
  for i in pairs(b) do
      table.insert(out,i)
   end
  return out
end

function M.incomingImages(dataPath, imgSize)
   -- 1. load imageFiles into images and target Tensors
   local imageFiles = paths.indexdir(dataPath, 'jpg' ) 

   local size = imageFiles:size() 
   local images = torch.FloatTensor(size, 3, imgSize , imgSize)
   local filenames={}

   for i=1,size do
     local filename = imageFiles:filename(i)
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
return(M)

