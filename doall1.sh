#!/bin/bash

IMAGE=TorchGPU1

docker exec -it $IMAGE ./convExperiment.sh EH44 --learningRate 0.001 --minLR 0.0000001 --standardize --zca --lecunlcn --hiddenSize '{400}' --batchNorm --dropout

docker exec -it $IMAGE ./convExperiment2.sh EH_2_40 --learningRate 0.001 --minLR 0.0000001 --standardize --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_41 --learningRate 0.001 --minLR 0.00000000001 --saturateEpoch 100 --standardize --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_42 --learningRate 0.001 --minLR 0.0000001 --batchSize 96 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_43 --learningRate 0.001 --minLR 0.0000001 --batchSize 128 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm



exec ./doall1a.sh
