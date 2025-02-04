if [ -n "$1" ]; then
	echo "Data dir: $1"
else
	echo "usage: ./docker/run.sh <DATA_DIR>"
	exit -1
fi

IMAGE_NAME=n3mapping

xhost +

docker run --gpus all \
	-ti \
	-it \
	--rm \
	--env="DISPLAY" \
    --shm-size 24G \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--privileged \
	--network host \
	-e DISPLAY=$DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-v "$1:/workspace/data/" \
	${IMAGE_NAME} \
	bash -c /bin/bash