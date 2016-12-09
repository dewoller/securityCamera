
require 'torch' 
require 'dp' 
require 'optim' 
require 'cutorch'
require 'cunn'

dat=torch.load('/root/save/E30/64/TorchGPU1:1480998087:1.dat')

ds=sc.securityCamera( '/root/data/securityCamera/64/', 64)
