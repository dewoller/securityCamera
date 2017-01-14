#!/bin/bash

IMAGE=TorchGPU2

docker exec -it $IMAGE ./deepExperiment.sh DeepHidden1  --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden2  --learningRate 0.001 --dropout --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden3  --learningRate 0.0001 --dropout --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden4  --learningRate 0.00001 --dropout --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden5  --learningRate 0.00001 --dropout --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden6  --learningRate 0.00001 --dropout --standardize --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden7  --learningRate 0.00001 --dropout --zca --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden8  --learningRate 0.00001 --dropout --lecunlcn --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden9  --learningRate 0.00001 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden10  --learningRate 0.00001 --maxOutNorm 2 --dropout --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden11  --learningRate 0.1 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden12  --learningRate 0.01 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden13  --learningRate 0.001 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden14  --learningRate 0.0001 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden15  --learningRate 0.00001 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden16  --learningRate 0.000001 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden17  --learningRate 0.1 --batchNorm --standardize --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden18  --learningRate 0.01 --batchNorm --standardize --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden19  --learningRate 0.001 --batchNorm --standardize --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden20  --learningRate 0.0001 --batchNorm --standardize --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden21  --learningRate 0.00001 --batchNorm --standardize --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden22  --learningRate 0.000001 --batchNorm --standardize --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden23  --learningRate 0.1 --batchNorm --zca --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden24  --learningRate 0.01 --batchNorm --zca --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden25  --learningRate 0.001 --batchNorm --zca --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden26  --learningRate 0.0001 --batchNorm --zca --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden27  --learningRate 0.00001 --batchNorm --zca --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden28  --learningRate 0.000001 --batchNorm --zca --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden29  --learningRate 0.1 --batchNorm --lecunlcn --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden30  --learningRate 0.01 --batchNorm --lecunlcn --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden31  --learningRate 0.001 --batchNorm --lecunlcn --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden32  --learningRate 0.0001 --batchNorm --lecunlcn --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden33  --learningRate 0.00001 --batchNorm --lecunlcn --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden34  --learningRate 0.000001 --batchNorm --lecunlcn --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden35  --learningRate 0.01 --batchSize 64 --batchNorm --hiddenSize {4000,4000} --accUpdate
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden36  --learningRate 0.01 --batchSize 128 --batchNorm --hiddenSize {4000,4000} --accUpdate
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden37  --learningRate 0.01 --momentum 0.5 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden38  --learningRate 0.01 --momentum 1 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden39  --learningRate 0.01 --momentum 2 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden40  --learningRate 0.01 --momentum 4 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden41  --learningRate 0.01 --maxOutNorm 1 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden42  --learningRate 0.01 --maxOutNorm 2 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden43  --learningRate 0.01 --maxOutNorm 3 --batchNorm --hiddenSize {4000,4000}
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden44  --learningRate 0.01 --maxOutNorm 4 --batchNorm --hiddenSize {4000,4000} --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden45  --learningRate 0.01 --batchNorm --hiddenSize {4000,4000} --maxTries 500
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden46  --learningRate 0.01 --batchNorm --hiddenSize {4000,4000} --maxTries 1000
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden47  --learningRate 0.01 --batchNorm --hiddenSize {4000,4000} --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden48  --learningRate 0.01 --batchNorm --hiddenSize {4000,4000} --maxEpoch 5000 --maxTries 500
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden49  --learningRate 0.01 --batchNorm --hiddenSize {4000,4000} --maxEpoch 5000 --maxTries 1000
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden50  --learningRate 0.001 --momentum 0.5 --batchNorm --hiddenSize {4000,4000} --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden51  --learningRate 0.001 --momentum 0.6 --batchNorm --hiddenSize {4000,4000} --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden52  --learningRate 0.001 --momentum 0.7 --batchNorm --hiddenSize {4000,4000} --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden53  --learningRate 0.001 --momentum 0.8 --batchNorm --hiddenSize {4000,4000} --maxEpoch 5000 --maxTries 100
docker exec -it $IMAGE ./deepExperiment.sh DeepHidden54  --learningRate 0.001 --momentum 0.9 --batchNorm --hiddenSize {4000,4000} --maxEpoch 5000 --maxTries 100




exec ./doall1a.sh
