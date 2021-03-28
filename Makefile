
check-gpu-on-instance:
	lspci | grep -i nvidia

install-nvidia-container-runtime:
	bash bin/install-nvidia-container-toolkit.sh

check-nvidia-container-runtime:
	docker run --gpus all --rm nvidia/cuda nvidia-smi

setup:
	bash bin/setup.sh


%:
	@: