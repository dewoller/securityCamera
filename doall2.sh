#!/bin/bash
IMAGE=TorchGPU2


docker exec -it $IMAGE ./deepExperiment.sh E49  --learningRate 0.01 --batchNorm --maxEpoch 5000 --maxTries 1000


exec ./doall2a.sh
