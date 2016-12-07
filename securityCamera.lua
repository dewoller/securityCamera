require 'dp'
require 'torchx' -- for paths.indexdir
local M = {}

function M.securityCamera(dataPath, imgsize, validRatio)
   validRatio = validRatio or 0.15

   -- 1. load images into input and target Tensors
   local other = paths.indexdir(paths.concat(dataPath, 'other')) -- 1
   local pp = paths.indexdir(paths.concat(dataPath, 'pp')) -- 2
   local car = paths.indexdir(paths.concat(dataPath, 'car')) -- 3

   local size = other:size() + pp:size() + car:size()
   local shuffle = torch.randperm(size) -- shuffle the data
   local input = torch.FloatTensor(size, 3, imgsize , imgsize)
   local target = torch.IntTensor(size):fill(1)

   for i=1,other:size() do
      local img = image.load(other:filename(i))
      local idx = shuffle[i]
      input[idx]:copy(img)
      collectgarbage()
   end

   for i=1,pp:size() do
      local img = image.load(pp:filename(i))
      local idx = shuffle[i+other:size()]
      input[idx]:copy(img)
      target[idx] = 2
      collectgarbage()
   end

   for i=1,car:size() do
      local img = image.load(car:filename(i))
      local idx = shuffle[i+other:size() + pp:size() ]
      input[idx]:copy(img)
      target[idx] = 3
      collectgarbage()
   end

   -- 2. divide into train and valid set and wrap into dp.Views

   local nValid = math.floor(size*validRatio)
   local nTrain = size - nValid

   local trainInput = dp.ImageView('bchw', input:narrow(1, 1, nTrain))
   local trainTarget = dp.ClassView('b', target:narrow(1, 1, nTrain))
   local validInput = dp.ImageView('bchw', input:narrow(1, nTrain+1, nValid))
   local validTarget = dp.ClassView('b', target:narrow(1, nTrain+1, nValid))

   trainTarget:setClasses({'other', 'pp', 'car' })
   validTarget:setClasses({'other', 'pp', 'car' })

   -- 3. wrap views into datasets

   local train = dp.DataSet{inputs=trainInput,targets=trainTarget,which_set='train'}
   local valid = dp.DataSet{inputs=validInput,targets=validTarget,which_set='valid'}

   -- 4. wrap datasets into datasource

   local ds = dp.DataSource{train_set=train,valid_set=valid}
   ds:classes{'other', 'pp', 'car' }
   return ds
end

return M
