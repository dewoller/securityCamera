#!/bin/bash

IMAGE=TorchGPU1

docker exec -it $IMAGE ./deepExperiment.sh E50  --learningRate 0.001 --momentum 0.5 --batchNorm --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh E51  --learningRate 0.001 --momentum 0.6 --batchNorm --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh E52  --learningRate 0.001 --momentum 0.7 --batchNorm --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh E53  --learningRate 0.001 --momentum 0.8 --batchNorm --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh E54  --learningRate 0.001 --momentum 0.9 --batchNorm --maxEpoch 5000 --maxTries 100

exec ./doall1a.sh
