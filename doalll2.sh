#!/bin/bash
IMAGE=TorchGPU2


	docker exec -it $IMAGE ./deepExperiment.sh E22  --learningRate 0.000001 --batchNorm --standardize
	docker exec -it $IMAGE ./deepExperiment.sh E23  --learningRate 0.1 --batchNorm --zca
	docker exec -it $IMAGE ./deepExperiment.sh E24  --learningRate 0.01 --batchNorm --zca
	docker exec -it $IMAGE ./deepExperiment.sh E25  --learningRate 0.001 --batchNorm --zca
	docker exec -it $IMAGE ./deepExperiment.sh E26  --learningRate 0.0001 --batchNorm --zca
	docker exec -it $IMAGE ./deepExperiment.sh E27  --learningRate 0.00001 --batchNorm --zca
	docker exec -it $IMAGE ./deepExperiment.sh E28  --learningRate 0.000001 --batchNorm --zca
	docker exec -it $IMAGE ./deepExperiment.sh E29  --learningRate 0.1 --batchNorm --lecunlcn
	docker exec -it $IMAGE ./deepExperiment.sh E30  --learningRate 0.01 --batchNorm --lecunlcn
	docker exec -it $IMAGE ./deepExperiment.sh E31  --learningRate 0.001 --batchNorm --lecunlcn
	docker exec -it $IMAGE ./deepExperiment.sh E32  --learningRate 0.0001 --batchNorm --lecunlcn
	docker exec -it $IMAGE ./deepExperiment.sh E33  --learningRate 0.00001 --batchNorm --lecunlcn
	docker exec -it $IMAGE ./deepExperiment.sh E34  --learningRate 0.000001 --batchNorm --lecunlcn


exec ./doall2a.sh
