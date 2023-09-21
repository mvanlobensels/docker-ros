#! /bin/bash

xhost +local:
docker run -it --rm \
--net=host \
--user=$(id -u) \
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    -e DISPLAY \
    -e XDG_RUNTIME_DIR \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e NVIDIA_VISIBLE_DEVICES=all \
    -e NVIDIA_DRIVER_CAPABILITIES=graphics \
    --runtime=nvidia \
-e CONTAINER_NAME=ros-melodic-dev \
-e USER=$USER \
--workdir=/home/$USER \
-v "/etc/group:/etc/group:ro" \
-v "/etc/passwd:/etc/passwd:ro" \
-v "/etc/shadow:/etc/shadow:ro" \
-v "/etc/sudoers.d:/etc/sudoers.d:ro" \
-v "/home/$USER/:/home/$USER/" \
-v "/run/user/1000:/run/user/1000" \
--device=/dev/dri:/dev/dri \
--name=ros-melodic-dev \
--privileged \
osrf/ros:melodic-desktop-full
