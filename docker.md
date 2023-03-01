
# Docker

-------------------------------------------------------

## General Use
1. Write a **[Dockerfile](#dockerfiles)**

2. To build an image from a Dockerfile, use `docker build -t <container_name> .` with the `.` to specify the `Dockerfile` is in the current directory.
    ```sh
    $ docker build -t <image_name> .
    $ docker image ls                     # will show a list of images
    ```
    Can also help to build docker images using scripts.
    ```sh
    #!/bin/bash

    set -e # auto-exit on error

    usernum=34557
    daystr=$(date +%a)

    # use if Dockerfile has a diffent name
    DOCKERFILE=<docker_file_name>
    # also need to use the -f option

    echo "Building docker image with build options: $@"

    # Note: use --no-cache to prevent using cached images/layers which will
    # allow full/fresh/clean builds on Jenkins
    docker build -t <image_name> \
        --build-arg HTTP_PROXY="http://$usernum:$daystr@proxy" \
        --build-arg http_proxy="http://$usernum:$daystr@proxy" \
        $@ \
        -f ./$DOCKERFILE \
        .

    exit 0
    ```

3. Once the image is created, it can be ran as a container. 
    ```sh
    $ docker run <image_name>
    ```
    To set all options, might be helpful to use a script to run containers:
    ```sh
    WORK_PATH="$HOME"/local
    GNU_HOME=/home/gnuradio

    docker run -it --rm \
        --env HTTP_PROXY=$HTTP_PROXY \
        --env HTTPS_PROXY=$HTTP_PROXY \
        --env http_proxy=$HTTP_PROXY \
        --env https_proxy=$HTTP_PROXY \
        --env NO_PROXY=$NO_PROXY \
        --network=host \
        --env DISPLAY=${DISPLAY} \
        --env XAUTHORITY=$GNU_HOME/.Xauthority \
        -v "$HOME/.Xauthority:$GNU_HOME/.Xauthority:rw" \
        -v "$WORK_PATH:$GNU_HOME/workspace/" \
        -v "$HOME/.bashrc:$GNU_HOME/.bashrc" \
        -v "$HOME/.login_message:$GNU_HOME/.login_message" \
        <image_name> bash
    ```

4. To stop a container, use `stop`
    ```sh
    $ docker container ls               # will show a list of containers
    $ docker ps                         # will show all containers running
    $ docker stop <container_name>
    ```

> **intructions below are optional**

5. Docker can also be use some server applications, these are different than the intructions above.
    After the image is built, the container is now a REST server and will run in a lopp waiting for request. The container is running in an isolated enviroment (including networking) so to access the container, an access port has to be published to the local network.
    ```sh
    $ docker run --publish 8000:8000 <image_name>
    ```

6. Make a POST request using `curl`
    ```sh
    $ docker run --publish 8000:8000 <image_name>
    ```


## Docker Notes
Docker is used to develop, release, and run applications. An application can be packedged and ran in a isolated enviroment called a **container**.

- Docker uses a client-server architecture. There is a docker **client** which talks to the docker **deamon**. the deamon is in charged of building, running, and releasing the docker container. They can run on the same system, or a docker client can be connected to a remote daemon. They can communicate using a REST API, unix sockets or a network interface
- Docker **Deamom (`dockerd`)** listens for Docker API request and manages Docker objects
    - **Images** are read-only templates with instructions on creating a docker container. an image can be based on another
    - To build an image, create a **Dockefile** which defines the steps to create and run an image.
    - each step is a layer of the image, when changes are made to the dockerfile, only layers changed are rebuilt
- Docker **Client** is what users use to interact with docker. For example, using a command such as `docker run`, the client sends these to `dockerd` which carries them out. a client can communicate with multiple dockerds.
- Docker Compose allows working with applications that consists of multiple containers
- Docker images can be stored in docker registries


### Storage
- **Storage drivers** can be used. for linux `overlay2` is recommended. more about them here: <https://docs.docker.com/storage/storagedriver/select-storage-driver/>
- **Volumes** are the preferred way to store data generaded and used by docker containers. they are managed completely by docker unlike bind mo8utns, which are handled by the host machine. more here: <https://docs.docker.com/storage/volumes/>
- **Bind Mounts** have limited functionality compared to volume. Here a file or directory on the host machine is mounted into a container. the file is then referenced by its absolute path on the host machine. 
- **secrets** here: <https://docs.docker.com/engine/swarm/secrets/> and config files for non-sensitive information: <https://docs.docker.com/engine/swarm/configs/>


## Dockerfiles
best practices for writing dockerfiles: **<https://docs.docker.com/develop/develop-images/dockerfile_best-practices/>**

- keep images small. these are faster to pull over the network and faster to load into memory
- start with an appropiate base image.
- reduce the number of application layers. below for example, the code segment has two layers
```go
RUN apt-get -y update
RUN apt-get install -y python
```
while the second only has one
```go
RUN apt-get -y update && apt-get install -y python
```

Syntax:
```go
# syntax=docker/dockerfile:1
FROM ubuntu:18.04
COPY . /app
RUN make /app
CMD python /app/app.py
```

- `FROM` creates a layer for the ubuntu image
- `COPY` add files from docker client curent directory
- `RUN` builds application with `make`
- `CMD` specifiies a command to run within the container

### Multi-stage Builds
using the `FROM` statement you can copy specify files you want from an image, leaving everything else behind.
```go
# syntax=docker/dockerfile:1
FROM golang:1.16                                                        # image
WORKDIR /go/src/github.com/alexellis/href-counter/                      # working directory
RUN go get -d -v golang.org/x/net/html                                  # run program
COPY app.go ./                                                          # copies program from previous stage
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/alexellis/href-counter/app ./
CMD ["./app"]  
```


