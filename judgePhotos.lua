require 'torch' 
dp=require 'dp' 
optim=require('optim')
mu=dofile('myUtilities.lua')
--cutorch=require 'cutorch'
--cunn=require 'cunn'

require 'lfs' 

--[[command line arguments]]--

cmd = torch.CmdLine()
cmd:text()
cmd:text('judge files in a directory according to a model, optionally move files to a target directory based on judgement')
cmd:text('Example:')
cmd:text('$> th judgePhotos.lua --dir /securityCamera/incoming')
cmd:text('Options:')
cmd:option('--photoDir', '/store/images/incoming/128', 'picture source ')
cmd:option('--originalDir', '/store/images/incoming/original', 'where the original pictures are, use this for the copy if exists')
cmd:option('--model', '/code/securityCamera/E45_128_model.t7', 'model file used for judging pictures')
cmd:option('--needResize', false, 'boolean, do we need to resize incoming pictures')
cmd:option('--imageSize', 128, 'the size of the images in the model')
cmd:option('--copyDir', '', 'where should we copy the files once we have judged them (this assumes we trust the model)')
cmd:option('--stats', true, 'display per label frequencies ')
cmd:option('--silent', false, 'dont print anything to stdout')
cmd:text()
opt = cmd:parse(arg or {})
if not opt.silent then
   table.print(opt)
end

if opt.photoDir== "" then
  print("I need photos to judge")
  return
end

model = mu.getModelFromFile(opt.model)

categories = {'other','pp','car'}
print 'loading images'

images, filenames = mu.incomingImages(opt.photoDir, opt.imageSize, opt.needResize )

-- strip directories, cause we have photoDir
for i,name in ipairs(filenames) do
  filenames[i]=mu.basename(filenames[i])
end

print 'categorising images'

labels=mu.categoriseImages(model, images )

if opt.stats then
  local freq = torch.IntTensor( #categories ):zero()
  for i,category in pairs( categories ) do
    freq[i]=labels:squeeze():int():eq( torch.IntTensor(labels:size()):fill(i)):sum() 
  end
  for i,category in pairs( categories ) do
    print( string.format( '%s\t%i\t%i\t%f', category, i, freq[i], freq[i]/freq:sum() * 100))
  end
end

if opt.copyDir ~= '' then
  mu.saveImages( filenames, labels, opt.originalDir, opt.copyDir, categories)
end




