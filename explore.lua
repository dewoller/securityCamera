
torch=require 'torch' 
dp=require 'dp' 
optim=require 'optim' 

cutorch=require 'cutorch'
cunn=require 'cunn'
sc=require('securityCamera')


function getFile(dir, pattern )  --  return the list of file that match this pattern
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
--dat=torch.load('/root/save/E30/64/TorchGPU1:1480998087:1.dat')
--dat=torch.load('/root/save/deep/E46/096/TorchGPU2:1481464717:1.dat')

--dat=torch.load('/root/save/deep/E46/032/TorchGPU2:1481456764:1.dat')
--garbagecollect()
imgSize='128'
dat=torch.load( getFile( '/root/save/deep/E49/' .. imgSize .. '/', '.*dat$')[1])
ds=sc.securityCamera( '/root/data/securityCamera/' .. tonumber( imgSize ) .. '/', tonumber( imgSize ) )

t_inputs=ds:get('train','inputs','bchw')
t_targets=ds:get('train','targets','b')
v_inputs=ds:get('valid','inputs','bchw')
v_targets=ds:get('valid','targets','b')
m=dat:model()

function categoriseImages( model, images, labels ) 
  local maxImagesInBatch = 100
  local rv=Torch.IntTensor()
  for i,batch in pairs( images:split( maxImagesInBatch )) do
    local predictions = model:forward( batch )
    local __,targets = predictions:max(2)
    rv:cat( targets )
  end
  return rv
end





