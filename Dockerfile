FROM centos/devtoolset-4-toolchain-centos7

USER root

RUN yum update -y -q && yum install -y -q wget git cmake make bzip2-devel unzip && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda3-latest-Linux-x86_64.sh && ./Miniconda3-latest-Linux-x86_64.sh -b && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - && \
    ln -s `find /usr/lib64/ -type f -name "libbz2.so.1*"` /usr/lib64/libbz2.so.1.0

RUN echo ". $HOME/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc &&  \
    echo "source $HOME/.poetry/env" >> ~/.bashrc && \
    source ~/.bashrc && conda init bash

CMD ["/bin/bash"]
