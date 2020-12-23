FROM centos:centos7

USER root

WORKDIR /root

RUN yum install -y wget && wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda3-latest-Linux-x86_64.sh && ./Miniconda3-latest-Linux-x86_64.sh -b && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH "$PATH:./miniconda3/bin/"

RUN echo ". ./miniconda3/etc/profile.d/conda.sh" >> ~/.profile && \
    conda init bash && conda create -n env python=3.7 -y

CMD ["/bin/bash"]
