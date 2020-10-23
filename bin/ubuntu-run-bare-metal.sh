export DEBIAN_FRONTEND=noninteractive

sudo apt-get install -y g++ python3 python3-pip python3-opencv libmkl-rt
sudo python3 -m pip install -r requirements.txt
bin/compile.sh
