#!/bin/bash

IMAGE=TorchGPU1


docker exec -it $IMAGE ./convExperiment.sh E0 --learningRate 0.1 --maxEpoch 100 --activation Tanh
docker exec -it $IMAGE ./convExperiment.sh E1 --maxEpoch 100 --activation Tanh --dropout n
docker exec -it $IMAGE ./convExperiment.sh E2 --maxEpoch 10000 --activation Tanh --dropout n
docker exec -it $IMAGE ./convExperiment.sh E3 --maxEpoch 10000 --activation Tanh --dropout
docker exec -it $IMAGE ./convExperiment.sh E4 --maxEpoch 10000 --activation ReLU --dropout n
docker exec -it $IMAGE ./convExperiment.sh E5 --maxEpoch 10000 --activation ReLU --dropout
docker exec -it $IMAGE ./convExperiment.sh E6 --maxEpoch 10000 --activation Sigmoid --dropout n
docker exec -it $IMAGE ./convExperiment.sh E7 --maxEpoch 10000 --activation Sigmoid --dropout
docker exec -it $IMAGE ./convExperiment.sh E8
docker exec -it $IMAGE ./convExperiment.sh E9 --zca
docker exec -it $IMAGE ./convExperiment.sh E10 --lecunlcn
docker exec -it $IMAGE ./convExperiment.sh E11 --zca --lecunlcn
docker exec -it $IMAGE ./convExperiment.sh E12 --standardize
docker exec -it $IMAGE ./convExperiment.sh E13 --standardize --zca
docker exec -it $IMAGE ./convExperiment.sh E14 --standardize --lecunlcn
docker exec -it $IMAGE ./convExperiment.sh E15 --standardize --zca --lecunlcn


exec ./doall1a.sh
