FROM ubuntu:24.04

COPY TEX_* /tmp/
ENV DEBIAN_FRONTEND=non-interactive
RUN apt-get update && \
    apt-get install -y texlive-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
