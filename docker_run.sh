#! /bin/bash

xhost +local:
docker run -it --rm \
--net=host \
--user=$(id -u) \
-e DISPLAY=$DISPLAY \
-e QT_GRAPHICSSYSTEM=native \
-e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
--env="QT_X11_NO_MITSHM=1" \
-e CONTAINER_NAME=ros-humble-dev \
-e USER=$USER \
--workdir=/home/$USER \
-v "/tmp/.X11-unix:/tmp/.X11-unix" \
-v "/etc/group:/etc/group:ro" \
-v "/etc/passwd:/etc/passwd:ro" \
-v "/etc/shadow:/etc/shadow:ro" \
-v "/etc/sudoers.d:/etc/sudoers.d:ro" \
-v "/home/$USER/:/home/$USER/" \
-v "/run/user/1000:/run/user/1000" \
--device=/dev/dri:/dev/dri \
--name=ros-humble-dev \
--privileged \
ros-humble-dev:latest
