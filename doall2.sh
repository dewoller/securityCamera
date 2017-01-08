#!/bin/bash

IMAGE=TorchGPU2

docker exec -it $IMAGE ./convExperiment.sh E16 --learningRate 0.01 --maxEpoch 300 --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E17 --learningRate 0.001 --maxEpoch 300 --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E18 --learningRate 0.0001 --maxEpoch 300 --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E19 --learningRate 0.1 --maxEpoch 300 --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E20 --learningRate 0.001 --minLR 0.00000001 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E21 --learningRate 0.001 --minLR 0.000000001 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E22 --learningRate 0.001 --minLR 0.0000000001 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E23 --learningRate 0.001 --minLR 0.00000000001 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E24 --learningRate 0.001 --minLR 0.00000000001 --saturateEpoch 100 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E25 --learningRate 0.1 --minLR 0.0000001 --saturateEpoch 100 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E26 --learningRate 0.01 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E27 --learningRate 0.001 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E28 --learningRate 0.0001 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E29 --learningRate 0.1 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E30 --learningRate 0.001 --minLR 0.0000001 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E31 --learningRate 0.001 --momentum 1 --maxEpoch 300 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E32 --learningRate 0.001 --maxEpoch 300 --standardize --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E33 --learningRate 0.001 --maxEpoch 300 --zca --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E34 --learningRate 0.001 --maxEpoch 300 --lecunlcn --activation ReLU --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E35 --learningRate 0.001 --maxEpoch 300 --lecunlcn --activation Sigmoid --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E36 --learningRate 0.001 --maxEpoch 300 --lecunlcn --dropout
docker exec -it $IMAGE ./convExperiment.sh E37 --learningRate 0.001 --padding --maxEpoch 300 --lecunlcn
docker exec -it $IMAGE ./convExperiment.sh E38 --learningRate 0.001 --minLR 0.0000001 --lecunlcn --activation ReLU --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E39 --learningRate 0.001 --minLR 0.0000001 --zca --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E40 --learningRate 0.001 --minLR 0.0000001 --standardize --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E41 --learningRate 0.001 --minLR 0.00000000001 --saturateEpoch 100 --standardize --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E42 --learningRate 0.001 --minLR 0.0000001 --batchSize 96 --lecunlcn --batchNorm
docker exec -it $IMAGE ./convExperiment.sh E43 --learningRate 0.001 --minLR 0.0000001 --batchSize 128 --lecunlcn --batchNorm




exec ./doall1a.sh
