FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
	git \
	ansible \
rm -rf /var/lib/apt/lists/*

