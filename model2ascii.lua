
mu=require('myUtilities.lua')
require('nn')
require('optim')
require('dp')

function saveModelASCII(imgSize, path, outFile )
  imgSize= imgSize or 128
  path = path or '/root/save/deep/E49/'
  outFile = outFile or "try.model"
  model = torch.load( mu.getFile( path .. imgSize .. '/', '.*dat$')[1]):model():float()
  torch.save(outFile, model, 'ascii')
end


function resaveModel(inFile, outFile )
  inFile = inFile or "try.model"
  outFile = outFile or "try.t7"
  model = torch.load( inFile, 'ascii' )
  torch.save(outFile, model)
end




