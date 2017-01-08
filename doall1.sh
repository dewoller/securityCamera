#!/bin/bash

IMAGE=TorchGPU1


docker exec -it $IMAGE ./convExperiment.sh  --learningRate=0.1 --maxEpoch=100 --activation=Tanh


exec ./doall1a.sh
