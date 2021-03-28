FROM hifi3dface-base-ubuntu:latest

WORKDIR /app

COPY 3DMM .
COPY resources .

COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

COPY figures .
COPY texture .
COPY optimization .
COPY third_party .
COPY data_prepare .
COPY utils .
COPY bin .

RUN bin/compile.sh
