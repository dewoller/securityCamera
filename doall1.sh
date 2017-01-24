#!/bin/bash

IMAGE=TorchGPU1

docker exec -it $IMAGE ./convExperiment2.sh EH_2_16 --learningRate 0.01 --maxEpoch 300 --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_21 --learningRate 0.001 --minLR 0.000000001 --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_26 --learningRate 0.01 --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_27 --learningRate 0.001 --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_28 --learningRate 0.0001 --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_29 --learningRate 0.1 --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_30 --learningRate 0.001 --minLR 0.0000001 --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_31 --learningRate 0.001 --momentum 1 --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_32 --learningRate 0.001 --maxEpoch 300 --standardize --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_33 --learningRate 0.001 --maxEpoch 300 --zca --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_34 --learningRate 0.001 --maxEpoch 300 --lecunlcn --activation ReLU --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_35 --learningRate 0.001 --maxEpoch 300 --lecunlcn --activation Sigmoid --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_36 --learningRate 0.001 --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}' --dropout
docker exec -it $IMAGE ./convExperiment2.sh EH_2_37 --learningRate 0.001 --padding --maxEpoch 300 --lecunlcn --hiddenSize '{4000,4000}'
docker exec -it $IMAGE ./convExperiment2.sh EH_2_38 --learningRate 0.001 --minLR 0.0000001 --lecunlcn --activation ReLU --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_39 --learningRate 0.001 --minLR 0.0000001 --zca --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_40 --learningRate 0.001 --minLR 0.0000001 --standardize --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_41 --learningRate 0.001 --minLR 0.00000000001 --saturateEpoch 100 --standardize --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_42 --learningRate 0.001 --minLR 0.0000001 --batchSize 96 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm
docker exec -it $IMAGE ./convExperiment2.sh EH_2_43 --learningRate 0.001 --minLR 0.0000001 --batchSize 128 --lecunlcn --hiddenSize '{4000,4000}' --batchNorm



exec ./doall1a.sh
