FROM hifi3dface-base-ubuntu:latest

WORKDIR /app
COPY . .
RUN python3 -m pip install -r requirements.txt
RUN bin/compile.sh
