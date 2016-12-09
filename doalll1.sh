#!/bin/bash

IMAGE=TorchGPU1

	docker exec -it $IMAGE ./deepExperiment.sh E11  --learningRate 0.1 --batchNorm
	docker exec -it $IMAGE ./deepExperiment.sh E12  --learningRate 0.01 --batchNorm
	docker exec -it $IMAGE ./deepExperiment.sh E13  --learningRate 0.001 --batchNorm
	docker exec -it $IMAGE ./deepExperiment.sh E14  --learningRate 0.0001 --batchNorm
	docker exec -it $IMAGE ./deepExperiment.sh E15  --learningRate 0.00001 --batchNorm
	docker exec -it $IMAGE ./deepExperiment.sh E16  --learningRate 0.000001 --batchNorm
	docker exec -it $IMAGE ./deepExperiment.sh E17  --learningRate 0.1 --batchNorm --standardize
	docker exec -it $IMAGE ./deepExperiment.sh E18  --learningRate 0.01 --batchNorm --standardize
	docker exec -it $IMAGE ./deepExperiment.sh E19  --learningRate 0.001 --batchNorm --standardize
	docker exec -it $IMAGE ./deepExperiment.sh E20  --learningRate 0.0001 --batchNorm --standardize
	docker exec -it $IMAGE ./deepExperiment.sh E21  --learningRate 0.00001 --batchNorm --standardize



exec ./doall1a.sh
