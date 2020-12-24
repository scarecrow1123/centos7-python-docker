FROM centos:centos7

USER root

WORKDIR /root

RUN yum update -y && yum install -y wget git gcc-c++ cmake make && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda3-latest-Linux-x86_64.sh && ./Miniconda3-latest-Linux-x86_64.sh -b && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

ENV PATH "$PATH:./miniconda3/bin/"

RUN echo ". ./miniconda3/etc/profile.d/conda.sh" >> ~/.profile && \
    conda init bash

CMD ["/bin/bash"]
