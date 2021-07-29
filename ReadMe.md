# GRYVATorRelay

## Purpose

GRYVATorRelay is a docker-image for simply running a tor-relay in a docker-container.

## Usage

### Volumes

Using volumes is not required. There are 2 optional volumes:

- `/userhome/.tor`
- `/var/log/tor`

The path in the container for this log-folder is `/var/log/tor`.

### Environment-variables

The following environment-variables are available:

- `nickname`
- `orport`
- `exitrelay`
- `socksport`
- `controlsocket`
- `contactinfo`
- `lognotice`
- `logdebug`

All of these environment-variables are required.

### Example

See `docker-compose.example.yml` for an example how to use it.

## Build

The image can be built using the following command:

``` sh
docker image build --no-cache --pull --force-rm --progress plain --tag gryvatorrelay:latest .
```

## Test

The image can be tested using the following command:

``` sh
docker-compose -f docker-compose.example.yml -p gryvatorrelay up
```

## Additional stuff

After running this container, take a look at the tasks listed at [community.torproject.org/relay/setup/post-install](https://community.torproject.org/relay/setup/post-install).
