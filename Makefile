
check-gpu-on-instance:
	lspci | grep -i nvidia

install-nvidia-container-runtime:
	bash bin/install-nvidia-container-toolkit.sh

check-nvidia-container-runtime:
	docker run --gpus all --rm nvidia/cuda nvidia-smi

check-tensorflow-installation:
	docker run \
    --rm -it \
    --gpus all \
    -v $PWD:/app \
    hifi3dface /bin/bash -c "python3 'from tensorflow.python.client import device_lib print device_lib.list_local_devices()'"

setup:
	bash bin/setup.sh


%:
	@: