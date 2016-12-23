#!/bin/bash

IMAGE=TorchGPU1


docker exec -it $IMAGE ./deepExperiment.sh E40  --learningRate 0.01 --momentum 4 --batchNorm
docker exec -it $IMAGE ./deepExperiment.sh E41  --learningRate 0.01 --maxOutNorm 1 --batchNorm
docker exec -it $IMAGE ./deepExperiment.sh E42  --learningRate 0.01 --maxOutNorm 2 --batchNorm
docker exec -it $IMAGE ./deepExperiment.sh E43  --learningRate 0.01 --maxOutNorm 3 --batchNorm
docker exec -it $IMAGE ./deepExperiment.sh E44  --learningRate 0.01 --maxOutNorm 4 --batchNorm --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh E45  --learningRate 0.01 --batchNorm --maxTries 500
docker exec -it $IMAGE ./deepExperiment.sh E46  --learningRate 0.01 --batchNorm --maxTries 1000
docker exec -it $IMAGE ./deepExperiment.sh E47  --learningRate 0.01 --batchNorm --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh E48  --learningRate 0.01 --batchNorm --maxEpoch 5000 --maxTries 500

exec ./doall1a.sh
