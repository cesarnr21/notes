
# Docker
Docker is used to develop, release, and run applications. An application can be packedged and ran in a isolated enviroment called a **container**.

- Docker uses a client-server architecture. There is a docker **client** which talks to the docker **deamon**. the deamon is in charged of building, running, and releasing the docker container. They can run on the same system, or a docker client can be connected to a remote daemon. They can communicate using a REST API, unix sockets or a network interface
- Docker **Deamom (`dockerd`)** listens for Docker API request and manages Docker objects
	- **Images** are read-only templates with instructions on creating a docker container. an image can be based on another
	- To build an image, create a **Dockefile** which defines the steps to create and run an image.
	- each step is a layer of the image, when changes are made to the dockerfile, only layers changed are rebuilt
- Docker **Client** is what users use to interact with docker. For example, using a command such as `docker run`, the client sends these to `dockerd` which carries them out. a client can communicate with multiple dockerds.
- Docker Compose allows working with applications that consists of multiple containers
- Docker images can be stored in docker registries

### Comands
- **`run`:**
- **`build`:**
	- `--target`: specifies a stage to stop building the dockerfile. example:
	```
	 docker build --target builder -t alexellis2/href-counter:latest .
	 ```
- **`pull`:**
- **`run`:**
- **`run`:**

## Dockerfiles
best practices for writing dockerfiles: <https://docs.docker.com/develop/develop-images/dockerfile_best-practices/>

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
FROM golang:1.16														# image
WORKDIR /go/src/github.com/alexellis/href-counter/						# working directory
RUN go get -d -v golang.org/x/net/html  								# run program
COPY app.go ./															# copies program from previous stage
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .	

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/alexellis/href-counter/app ./
CMD ["./app"]  
```

### Storage
- **Storage drivers** can be used. for linux `overlay2` is recommended. more about them here: <https://docs.docker.com/storage/storagedriver/select-storage-driver/>
- **Volumes** are the preferred way to store data generaded and used by docker containers. they are managed completely by docker unlike bind mo8utns, which are handled by the host machine. more here: <https://docs.docker.com/storage/volumes/>
- **Bind Mounts** have limited functionality compared to volume. Here a file or directory on the host machine is mounted into a container. the file is then referenced by its absolute path on the host machine. 
- **secrets** here: <https://docs.docker.com/engine/swarm/secrets/> and config files for non-sensitive information: <https://docs.docker.com/engine/swarm/configs/>
