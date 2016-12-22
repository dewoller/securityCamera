require('lfs')

local M = {}
function M.getFile(dir, filePattern )  --  return the list of file that match this filePattern
  rv={}
  --scan the directory's files
  for file in lfs.dir(dir) do
      --> look for any files ending with .jpg
      if file:match( filePattern ) then
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
     --print (filename)
     table.insert( filenames, filename )
      local img = image.load( filename , 3, 'byte')
      --images[i]:copy(image.scale( img, imgSize, imgSize ))  -- for resizing
      images[i]:copy( img )
      collectgarbage()
   end
   --
   -- 4. wrap datasets into datasource

   return images, filenames 
end



function M.allFilesMatching( base, dirPattern, filePattern, recurse )
  recurse = recurse or false
  filePattern=filePattern or '^.*$'
  dirPattern=dirPattern or '^.*$'
  rv={}
  for file in lfs.dir( base ) do
    if file~="." and file~=".." then
      local fullpath = base .. '/' .. file
      local mode =  lfs.attributes(fullpath, "mode")
      if mode == "file" and string.match( file, filePattern ) ~= nil and string.match(fullpath, dirPattern) then 
        table.insert(rv, base .. '/' .. file )
      elseif mode == "directory" and recurse  then 
        rv=M.appendTable( rv, M.allFilesMatching( fullpath, dirPattern, filePattern, recurse ))
      end
    end
  end
  return(rv)
end 


function M.appendTable( a, toappend )
  for i,value in pairs(toappend) do
     a[ #a + 1 ] = value
  end
  return(a)
end

function M.categoriseImages( model, images) 
  local maxImagesInBatch = 100
  local rv
  for i,batch in pairs( images:split( maxImagesInBatch )) do
    local predictions = model:forward( batch )
    local __,targets = predictions:max(2)
    if i==1 then
      rv = targets
    else
      rv = rv:cat( targets, 1 )
    end
    collectgarbage()
  end
  return rv
end

function M.basename(str)
	return string.gsub(str, "(.*/)(.*)", "%2")
end



return(M)

