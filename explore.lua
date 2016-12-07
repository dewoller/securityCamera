
require 'torch' 
require 'dp' 
require 'optim' 
require 'cutorch'
require 'cunn'

dat=torch.load('/root/save/E16/64/TorchGPU1:1480994085:1.dat')

ds=sc.securityCamera( '/root/data/securityCamera/64/', 64)
