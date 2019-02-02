# An alpine based docker image for Greengrass 1.7

This is a docker image that uses alpine:3.8 distro to run Greengrass. I am not using the alpine image directly, but use the [node:alpine](https://github.com/nodejs/docker-node/blob/daa131d713cf42ae181292471766879f750b5230/6/alpine/Dockerfile) container image.

## Build

To build the container run the usual

`docker build -t gg-alpine .`

## Run

To run the container, you should mount at least the following local volumes:
- `./config` to `/greengrass/config`
- `./certs` to `/greegrass/certs`

where you should put the Greengrass group configuration files.

 It is also recommeded to mount the following volumes:
- `./log` to `/greengrass/ggc/var/log`
- `./deployment` to `/greengrass/ggc/deployment`

You can do all that with the following command (assuming the container tag is `gg-alpine`)

```
docker run -d -v $PWD/config:/greengrass/config \
    -v $PWD/certs:/greengrass/certs \
    -v $PWD/deployment:/greengrass/ggc/deployment \
    -v $PWD/log:/greengrass/ggc/var/log gg-alpine
```