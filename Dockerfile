FROM hifi3dface-base-ubuntu:latest

WORKDIR /app
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
COPY . .
RUN bin/compile.sh
