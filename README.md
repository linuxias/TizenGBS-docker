[![CircleCI](https://circleci.com/gh/linuxias/TizenGBS-docker.svg?style=svg)](https://circleci.com/gh/linuxias/TizenGBS-docker)

# TizenGBS-docker
This repository is to create docker image what tizen module build using GBS.

## Build

#### 1. Build docker image without args
Build docker image. If you don't set user id, pw, etc., 'gbs-builder' is the default.

 ```bash
 $sudo docker build -t tizen .
 ```
 
#### 2. Build docker image with args
If you want to set user and group, you can build below:
```bash
$sudo docker build --build-args USER=user_id \
--build-args GROUP=group_id \
--build-args PW=my_password \
--tag tizen .
```

Please check if the docker image was built normally.

```bash
$sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
tizen               latest              29931db3eead        About a minute ago   698MB
```

## Run container

#### 1. using build image
```bash
$docker run --name tizen_builder -it --privileged -v ${SOURCE_PATH}:/home/user_id/path tizen
```

#### 2. using docker hub
```bash
$docker run --name tizen_builder -it --privileged -v ${SOURCE_PATH}:/home/user_id/path linuxias/tizen_gbs
```

### Remove image
```bash
$docker rmi --force tizen_gbs
```
