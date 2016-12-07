#!/usr/bin/zsh

 if [ $# -eq 0 ]; then
  echo "I need a device number"
  exit 1
fi

nvidia-docker \
	run \
	-it \
	--volume=$PWD:/root/notebook \
	--volume=/store/experimentalResults:/root/save \
	--volume=/home/dewoller/docker-torch/data:/root/data \
	--name TorchGPU$1 \
	--hostname TorchGPU$1 \
	torch \
	/bin/bash
