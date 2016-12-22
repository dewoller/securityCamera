
mu=require('myUtilities.lua')
require('nn')
require('optim')
require('dp')

function saveModelASCII(infile, outFile )
  outFile = outFile or "try.model"
  model = torch.load( infile ):model():float()
  torch.save(outFile, model, 'ascii')
end


function resaveModel(inFile, outFile )
  inFile = inFile or "try.model"
  outFile = outFile or "try.t7"
  model = torch.load( inFile, 'ascii' )
  torch.save(outFile, model)
end




