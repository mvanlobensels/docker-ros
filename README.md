# Docker ROS development environment

## Build

```bash
docker build --pull --rm -f "dockerfile" -t ros-humble-dev:latest "."
```

## Run

Without graphics:
```bash
./docker_run.sh
```

With Nvidia graphics:
```bash
./docker_run_nvidia.sh
```

Attach to running container:
```bash
./docker_attach.sh
```


