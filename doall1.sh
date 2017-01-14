#!/bin/bash

IMAGE=TorchGPU1

docker exec -it $IMAGE ./convExperiment.sh EH0 --learningRate 0.1 --maxEpoch 100 --activation Tanh --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH1 --maxEpoch 100 --activation Tanh --hiddenSize {4000,4000) --dropout n
docker exec -it $IMAGE ./convExperiment.sh EH2 --maxEpoch 10000 --activation Tanh --hiddenSize {4000,4000) --dropout n
docker exec -it $IMAGE ./convExperiment.sh EH3 --maxEpoch 10000 --activation Tanh --hiddenSize {4000,4000) --dropout
docker exec -it $IMAGE ./convExperiment.sh EH4 --maxEpoch 10000 --activation ReLU --hiddenSize {4000,4000) --dropout n
docker exec -it $IMAGE ./convExperiment.sh EH5 --maxEpoch 10000 --activation ReLU --hiddenSize {4000,4000) --dropout
docker exec -it $IMAGE ./convExperiment.sh EH6 --maxEpoch 10000 --activation Sigmoid --hiddenSize {4000,4000) --dropout n
docker exec -it $IMAGE ./convExperiment.sh EH7 --maxEpoch 10000 --activation Sigmoid --hiddenSize {4000,4000) --dropout
docker exec -it $IMAGE ./convExperiment.sh EH8 --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH9 --zca --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH10 --lecunlcn --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH11 --zca --lecunlcn --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH12 --standardize --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH13 --standardize --zca --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH14 --standardize --lecunlcn --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH15 --standardize --zca --lecunlcn --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH16 --learningRate 0.01 --maxEpoch 300 --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH17 --learningRate 0.001 --maxEpoch 300 --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH18 --learningRate 0.0001 --maxEpoch 300 --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH19 --learningRate 0.1 --maxEpoch 300 --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH20 --learningRate 0.001 --minLR 0.00000001 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH21 --learningRate 0.001 --minLR 0.000000001 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH22 --learningRate 0.001 --minLR 0.0000000001 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH23 --learningRate 0.001 --minLR 0.00000000001 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH24 --learningRate 0.001 --minLR 0.00000000001 --saturateEpoch 100 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH25 --learningRate 0.1 --minLR 0.0000001 --saturateEpoch 100 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH26 --learningRate 0.01 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH27 --learningRate 0.001 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH28 --learningRate 0.0001 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH29 --learningRate 0.1 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH30 --learningRate 0.001 --minLR 0.0000001 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH31 --learningRate 0.001 --momentum 1 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH32 --learningRate 0.001 --maxEpoch 300 --standardize --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH33 --learningRate 0.001 --maxEpoch 300 --zca --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH34 --learningRate 0.001 --maxEpoch 300 --lecunlcn --activation ReLU --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH35 --learningRate 0.001 --maxEpoch 300 --lecunlcn --activation Sigmoid --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH36 --learningRate 0.001 --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000) --dropout
docker exec -it $IMAGE ./convExperiment.sh EH37 --learningRate 0.001 --padding --maxEpoch 300 --lecunlcn --hiddenSize {4000,4000)
docker exec -it $IMAGE ./convExperiment.sh EH38 --learningRate 0.001 --minLR 0.0000001 --lecunlcn --activation ReLU --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH39 --learningRate 0.001 --minLR 0.0000001 --zca --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH40 --learningRate 0.001 --minLR 0.0000001 --standardize --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH41 --learningRate 0.001 --minLR 0.00000000001 --saturateEpoch 100 --standardize --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH42 --learningRate 0.001 --minLR 0.0000001 --batchSize 96 --lecunlcn --hiddenSize {4000,4000) --batchNorm
docker exec -it $IMAGE ./convExperiment.sh EH43 --learningRate 0.001 --minLR 0.0000001 --batchSize 128 --lecunlcn --hiddenSize {4000,4000) --batchNorm



exec ./doall1a.sh
