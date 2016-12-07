#!/bin/bash

IMAGE=TorchGPU1

#docker exec -it $IMAGE ./doExperiments.sh E12 --standardize
#docker exec -it $IMAGE ./doExperiments.sh E13 --standardize --zca
#docker exec -it $IMAGE ./doExperiments.sh E14 --standardize --lecunlcn 
#docker exec -it $IMAGE ./doExperiments.sh E15 --standardize --lecunlcn  --zca

docker exec -it $IMAGE ./doExperiments.sh E20 --learningRate 0.001 --maxEpoch 300 --batchNorm --lecunlcn --minLR 1e-08
docker exec -it $IMAGE ./doExperiments.sh E21 --learningRate 0.001 --maxEpoch 300 --batchNorm --lecunlcn --minLR 1e-09
docker exec -it $IMAGE ./doExperiments.sh E22 --learningRate 0.001 --maxEpoch 300 --batchNorm --lecunlcn --minLR 1e-10
docker exec -it $IMAGE ./doExperiments.sh E23 --learningRate 0.001 --maxEpoch 300 --batchNorm --lecunlcn --minLR 1e-11


