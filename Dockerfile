FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
	git \
	ansible \
	sshpass \
&& rm -rf /var/lib/apt/lists/*

