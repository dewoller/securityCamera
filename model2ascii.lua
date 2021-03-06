
mu=require('myUtilities.lua')
require('nn')
require('optim')
require('dp')
mu.loadRequire('cutorch')
mu.loadRequire('cunn')

--[[command line arguments]]--
cmd = torch.CmdLine()
cmd:text()
cmd:text('convert a model to/from ascii')
cmd:text('Example:')
cmd:text('$> th model2ascii.lua --inFile Torch01.dat --fromDP true --outFile ascii.model --toAscii true --outType float')
cmd:text('Options:')
-- fundamentals 
cmd:option('--inFile','', 'input filename')
cmd:option('--outFile', '', 'output filename')
cmd:option('--outType', 'float', 'float or cuda')
cmd:option('--toAscii', 'false', 'true if we need to save ascii model')
cmd:option('--fromDP', 'true', 'true if we need to convert from torch*.dat file generated by dp')
cmd:option('--silent', 'false', 'dont print anything to stdout')
cmd:text()
opt = cmd:parse(arg or {})
if opt.silent=='false' then
   table.print(opt)
   print('loading model', opt.inFile)
end

model = mu.getModelFromFile(opt.inFile)

if opt.silent=='false' then
   print('converting model')
end
if opt.outType=='float' then
  model:float()
elseif opt.outType=='cuda' then
  model:cuda()
end

if opt.silent=='false' then
   print('saving model', opt.outFile)
end
if opt.toAscii=='true' then
  torch.save(opt.outFile, model, 'ascii')
else
  torch.save(opt.outFile, model)
end
