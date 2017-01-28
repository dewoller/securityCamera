#!/bin/bash

IMAGE=TorchGPU2

docker exec -it $IMAGE ./convExperiment2.sh EH_2_45 --learningRate 0.001 --minLR 0.0000001 --standardize --zca --lecunlcn --hiddenSize '{10746,4000}' --batchNorm --dropout
docker exec -it $IMAGE ./convExperiment2.sh EH_2_46 --learningRate 0.001 --minLR 0.0000001 --standardize --zca --lecunlcn --batchNorm --dropout
docker exec -it $IMAGE ./convExperiment2.sh EH_2_47 --learningRate 0.001 --minLR 0.0000001 --standardize --zca --lecunlcn --hiddenSize '{40,40}' --batchNorm --dropout




exec ./doall1a.sh
