require 'torch' 
dp=require 'dp' 
optim=require('optim')
mu=require 'myUtilities'
cutorch=require 'cutorch'
cunn=require 'cunn'

require 'lfs' 

--[[command line arguments]]--

cmd = torch.CmdLine()
cmd:text()
cmd:text('judge files in a directory according to a model, optionally move files to a target directory based on judgement')
cmd:text('Example:')
cmd:text('$> th judgePhotos.lua --dir /securityCamera/incoming')
cmd:text('Options:')
cmd:option('--photodir', '/securityCamera/incoming', 'picture source ')
cmd:option('--originals', '/securityCamera/incoming', 'where the original pictures are')
cmd:option('--model', '', 'the location of the model used for judging')
cmd:option('--needResize', '', 'boolean, do we need to resize incoming pictures')
cmd:option('--modelSize', 128, 'the size of the images in the model')
cmd:option('--v2', 'validator', 'v2 to plot')
cmd:option('--v3', 'loss', 'v3 to plot')
cmd:option('--dump', false , 'dump all variables in files')
opt = cmd:parse(arg or {})

if opt.dir== "" then
  print("I need a directory to convert")
  return
end

categories = {'other','pp','car'}
print 'loading images'
originalDatapath='/mnt/piplus/securityCamera/incoming/'
--datapath='/store/images/incoming/128/'
if imageSet==nil then 
  imageSet={}
  datapath='/root/data/securityCamera/128/'
  for i,dirname in pairs( categories ) do
    imageSet[ dirname ] = mu.incomingImages(datapath .. '/' .. dirname, 128 )
    print (imageSet[ dirname ]:size())
  end
end

function judgeModels( 
for i,f in pairs(mu.allFilesMatching('/root/save/deep/', '/128/', 'Torch.*dat', true)) do

  model=torch.load( f ):model()
  rv={}
  print(f)
  print('expected down by obtained across')
  print('', categories[1], categories[2], categories[3])
  for inCategory,images in pairs(imageSet) do
    labels=mu.categoriseImages(model, images)
    numHits={}
    for i,outCategory in pairs(categories )  do
      numHits[ i ] = labels:squeeze():int():eq( torch.IntTensor(labels:size()):fill( i )):sum()
    end
    print(inCategory, numHits[1], numHits[2], numHits[3])
  end
end


