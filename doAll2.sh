#!/bin/bash
IMAGE=TorchGPU2


#docker exec -it $IMAGE ./doExperiments.sh E09 
#docker exec -it $IMAGE ./doExperiments.sh E10  --zca
#docker exec -it $IMAGE ./doExperiments.sh E11  --lecunlcn 
#docker exec -it $IMAGE ./doExperiments.sh E12  --lecunlcn  --zca


docker exec -it $IMAGE ./doExperiments.sh E24 --learningRate 0.001 --saturateEpoch 100 --batchNorm --lecunlcn --minLR 1e-11
docker exec -it $IMAGE ./doExperiments.sh E25 --learningRate 0.1 --saturateEpoch 100 --batchNorm --lecunlcn --minLR 1e-7

exec ./doall2a.sh
