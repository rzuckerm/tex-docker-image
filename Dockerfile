FROM ubuntu:20.04

COPY TEX_* requirements.txt /tmp/
COPY html2txt /usr/local/bin
ENV DEBIAN_FRONTEND=non-interactive
RUN apt-get update && \
    apt-get install -y python3 python3-pip texlive-base && \
    pip3 install -r /tmp/requirements.txt && \
    apt-get remove -y python3-pip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
