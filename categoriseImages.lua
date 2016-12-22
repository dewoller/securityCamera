dp=require 'dp' 
optim=require('optim')
mu=require 'myUtilities'
cutorch=require 'cutorch'
cunn=require 'cunn'

imgSize='128'
dat=torch.load( mu.getFile( '/root/save/deep/E47/' .. imgSize .. '/', '.*dat$')[1])
m=dat:model()
m=torch.load('E49_128_model.t7')


function categoriseImages( model, images) 
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

function basename(str)
	return string.gsub(str, "(.*/)(.*)", "%2")
end

function saveImages( filenames, labels, inDir, outDir) 
  -- copy images from /inDir/filename to outDir/label[i]/filename
  local dirs = mu.unique( labels:squeeze():totable() )
  for i,dirSuffix in pairs(dirs) do
     print(string.format( "mkdir -p %s/%s", outDir, dirSuffix ))
     os.execute(string.format( "mkdir -p %s/%s", outDir, dirSuffix ))
  end
  for i,filename in ipairs( filenames ) do 
    if math.floor(i/100) == i/100 then
      print( i )
    end
    --print( string.format( 'cp %s/%s %s/%s/%s', inDir, filename, outDir, labels[ i ]:totable()[1], filename) )
    os.execute( string.format( 'cp %s/%s) %s/%s/%s', inDir, filename, outDir, labels[ i ]:totable()[1], filename) )
  end
end

print 'loading images'
originalDatapath='/mnt/piplus/securityCamera/incoming/'
--datapath='/store/images/incoming/128/'
datapath='/root/data/securityCamera/128/other'
images, filenames = mu.incomingImages(datapath, 128 )
print (images:size())
for i,name in ipairs(filenames) do
   filenames[i]=basename(filenames[i])
end

print 'categorising images'

--labels=categoriseImages(m, images )
--print 'moving images'
--saveImages( filenames, labels, datapath, '/store/images/categorised/')

