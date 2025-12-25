FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# update and install apt packages
RUN apt update && apt-get install -y \
    sudo \
    wget \
    vim \
    build-essential \
    cmake \
    clang \
    git \
    libssl-dev \
    libgl1-mesa-glx \
    libx11-6 \
    libglib2.0-0 \
    ninja-build \
    python3-dev

# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN sh Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
RUN rm -r Miniconda3-latest-Linux-x86_64.sh
ENV PATH /opt/miniconda3/bin:$PATH

# accept miniconda terms of service
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

# create conda environment
RUN conda create -n Faces2Anime python=3.7
RUN conda init
RUN echo "conda activate Faces2Anime" >> ~/.bashrc
ENV CONDA_DEFAULT_ENV Faces2Anime && \
    PATH /opt/conda/envs/Faces2Anime/bin:$PATH

# upgrade pip
WORKDIR app
RUN pip install --upgrade pip

CMD ["/bin/bash"]