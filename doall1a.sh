#!/bin/bash
IMAGE=TorchGPU1


docker exec -it $IMAGE ./deepExperiment.sh E48  --learningRate 0.01 --batchNorm --maxEpoch 5000 --maxTries 500
docker exec -it $IMAGE ./deepExperiment.sh E49  --learningRate 0.01 --batchNorm --maxEpoch 5000 --maxTries 1000


exec ./doall1b.sh
