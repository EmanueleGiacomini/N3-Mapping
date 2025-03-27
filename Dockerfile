FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel
ARG UNAME=user
ARG UID=1000
ARG GID=1000

RUN apt-get --allow-unauthenticated update ; exit 0
RUN apt install -y wget \
    libx11-6 \
    libgl1 \
    git \
    libglib2.0-0


# libX11
# RUN apt install -y libeigen3-dev \
#     libgl-dev g++ build-essential libeigen3-dev \
#     python3-pip python3-dev cmake \
#     && apt clean

RUN groupadd -g $GID $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

RUN mkdir -p /workspace/data
WORKDIR /workspace
RUN pip install opencv-python open3d scikit-image wandb tqdm natsort \
	&& pip install kaolin==0.13.0 -f https://nvidia-kaolin.s3.us-east-2.amazonaws.com/torch-1.10.0_cu113.html

RUN chmod -R 777 /workspace
USER $UNAME
