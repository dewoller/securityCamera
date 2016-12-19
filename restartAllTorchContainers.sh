docker ps -a | grep TorchGPU | head -2 | cut -d' ' -f1 | xargs docker start
