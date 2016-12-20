
mu=require('myUtilities.lua')

function saveModelASCII(imgSize, path, outFile )
  imgSize= imgSize or 128
  path = path or '/root/save/deep/E49/'
  outFile = outFile or "try.model"
  model = torch.load( mu.getFile( path .. imgSize .. '/', '.*dat$')[1]):model()
  torch.save(outFile, model, 'ascii')
end


function resaveModel(infile, outFile )
  outFile = outFile or "try.model"
  model = torch.load( infile, 'ascii' )
  torch.save(outFile, model)
end




