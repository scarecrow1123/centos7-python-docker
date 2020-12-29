FROM centos/devtoolset-7-toolchain-centos7

USER root

ENV HOME=/opt/app-root/src

WORKDIR $HOME

RUN yum update -y -q && yum install -y -q wget git gcc-c++ cmake make bzip2-devel && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda3-latest-Linux-x86_64.sh && ./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3 && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - && \
    ln -s find /usr/lib64/ -type f -name "libbz2.so.1*"` /usr/lib64/libbz2.so.1.0

ENV PATH "$PATH:$HOME/miniconda3/bin/"

RUN echo ". $HOME/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc

CMD ["/bin/bash"]
