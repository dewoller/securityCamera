require 'dp'
require 'torchx' -- for paths.indexdir
local M = {}

function M.securityCamera2Category(dataPath, imgsize, validRatio, testRatio)
   validRatio = validRatio or 0.15
   testRatio = testRatio or 0.05

   -- 1. load images into input and target Tensors
   local other = paths.indexdir(paths.concat(dataPath, 'other')) -- 1
   local pp = paths.indexdir(paths.concat(dataPath, 'pp')) -- 2

   local size = other:size() + pp:size() 
   local shuffle = torch.randperm(size) -- shuffle the data
   local input = torch.FloatTensor(size, 3, imgsize , imgsize)
   local target = torch.IntTensor(size):fill(1)

   for i=1,other:size() do
      local img = image.load(other:filename(i),3,'byte')
      local idx = shuffle[i]
      input[idx]:copy(img)
      collectgarbage()
   end

   for i=1,pp:size() do
      local img = image.load(pp:filename(i),3,'byte')
      local idx = shuffle[i+other:size()]
      input[idx]:copy(img)
      target[idx] = 2
      collectgarbage()
   end

   -- 2. divide into train, valid and test sets and wrap into dp.Views

   local nValid = math.floor(size*validRatio)
   local nTest = math.floor(size*testRatio)
   local nTrain = size - (nValid + nTest )

   local trainInput = dp.ImageView('bchw', input:narrow(1, 1, nTrain))
   local trainTarget = dp.ClassView('b', target:narrow(1, 1, nTrain))
   local validInput = dp.ImageView('bchw', input:narrow(1, nTrain+1, nValid))
   local validTarget = dp.ClassView('b', target:narrow(1, nTrain+1, nValid))
   local testInput = dp.ImageView('bchw', input:narrow(1, nTrain+nValid+1, nTest))
   local testTarget = dp.ClassView('b', target:narrow(1, nTrain+nValid+1, nTest))

   trainTarget:setClasses({'other', 'pp' })
   validTarget:setClasses({'other', 'pp' })
   testTarget:setClasses({'other', 'pp' })

   -- 3. wrap views into datasets

   local train = dp.DataSet{inputs=trainInput,targets=trainTarget,which_set='train'}
   local valid = dp.DataSet{inputs=validInput,targets=validTarget,which_set='valid'}
   local test = dp.DataSet{inputs=testInput,targets=testTarget,which_set='test'}

   -- 4. wrap datasets into datasource

   local ds = dp.DataSource{train_set=train,valid_set=valid,test_set=test}
   ds:classes{'other', 'pp' }
   return ds
end

return M
