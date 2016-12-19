
function judgeBatch( model, images, labels) 
  local maxImagesInBatch = 100
  local predictions
  for i,imageBatch in pairs( images:split( maxImagesInBatch )) do
    local batchPredictions = select(2, model:forward( imageBatch ):max(2)):squeeze():int()
    if i==1 then
      predictions=batchPredictions
    else
      predictions=predictions:cat( batchPredictions )
    end
  end
  local debugger = require('fb.debugger')
  debugger.enter()
  local isCorrect = predictions:ne( labels ):nonzero():squeeze()
  local  badImages = images:index(1, isCorrect )
  local  origLabels = labels:index(1, isCorrect ) -- original label 
  local  badPredictions = predictions:index(1, isCorrect ) -- wrong prediction
  return { badImages, origLabels, badPredictions }
end

print(judgeBatch( m, t_inputs, t_targets))

