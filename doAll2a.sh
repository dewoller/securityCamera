#!/bin/bash
IMAGE=TorchGPU2




docker exec -it $IMAGE ./doExperiments.sh E38 --learningRate 0.001  --batchNorm --lecunlcn --minLR 1e-7 --activation ReLU
docker exec -it $IMAGE ./doExperiments.sh E39 --learningRate 0.001  --batchNorm --lecunlcn --minLR 1e-7 --zca
docker exec -it $IMAGE ./doExperiments.sh E40 --learningRate 0.001  --batchNorm --lecunlcn --minLR 1e-7 --standardize
docker exec -it $IMAGE ./doExperiments.sh E41 --learningRate 0.001  --batchNorm --lecunlcn --minLR 1e-7  --batchSize 96
docker exec -it $IMAGE ./doExperiments.sh E42 --learningRate 0.001  --batchNorm --lecunlcn --minLR 1e-7  --batchSize 128

exec ./doall2b.sh
