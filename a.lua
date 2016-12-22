dp=require 'dp' 
optim=require('optim')
mu=require 'myUtilities'
cutorch=require 'cutorch'
cunn=require 'cunn'


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
