
torch=require 'torch' 
dp=require 'dp' 
optim=require 'optim' 

cutorch=require 'cutorch'
cunn=require 'cunn'
sc=require('securityCamera')
mu=require('myUtilities')

--dat=torch.load('/root/save/E30/64/TorchGPU1:1480998087:1.dat')
--dat=torch.load('/root/save/deep/E46/096/TorchGPU2:1481464717:1.dat')

--dat=torch.load('/root/save/deep/E46/032/TorchGPU2:1481456764:1.dat')
--garbagecollect()
imgSize='128'
dat=torch.load( mu.getFile( '/root/save/deep/E49/' .. imgSize .. '/', '.*dat$')[1])
ds=sc.securityCamera( '/root/data/securityCamera/' .. tonumber( imgSize ) .. '/', tonumber( imgSize ) )

t_inputs=ds:get('train','inputs','bchw')
t_targets=ds:get('train','targets','b')
v_inputs=ds:get('valid','inputs','bchw')
v_targets=ds:get('valid','targets','b')
m=dat:model()






