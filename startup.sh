NV_GPU=0 nvidia-docker run --volume=/mnt/rdfs/UsersD/dewollershei/code/findPeopleNN:/root/notebook  --volume=/store/experimentalResults:/root/save --name TorchGPU1 --hostname TorchGPU1 --volume=/home/dewoller/torchData:/root/data torch /bin/bash 
NV_GPU=1 nvidia-docker run --volume=/mnt/rdfs/UsersD/dewollershei/code/findPeopleNN:/root/notebook  --volume=/store/experimentalResults:/root/save --name TorchGPU2 --hostname TorchGPU2 --volume=/home/dewoller/torchData:/root/data torch /bin/bash 
