dp=require 'dp' 
optim=require('optim')
mu=require 'myUtilities'
cutorch=require 'cutorch'
cunn=require 'cunn'

imgSize='128'
dat=torch.load( mu.getFile( '/root/save/deep/E49/' .. imgSize .. '/', '.*dat$')[1])
m=dat:model()


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
    print( string.format( 'cp %s/%s %s/%s/%s', inDir, filename, outDir, labels[ i ]:totable()[1], filename) )
    os.execute( string.format( 'cp %s/%s %s/%s/%s', inDir, filename, outDir, labels[ i ]:totable()[1], filename) )
  end
end

datapath='/root/data/securityCamera/incoming/128/'
images, filenames = mu.incomingImages(datapath, 128 )
for i,name in ipairs(filenames) do
   filenames[i]=basename(filenames[i])
end

labels=categoriseImages(m, images )
saveImages( filenames, labels, datapath, '/root/data/securityCamera/incoming/categorized')

