# GRYVATorRelay

## Purpose

GRYVATorRelay is a docker-image for simply running a tor-relay in a docker-container.

## Usage

### Volumes

Using volumes is not required. There is an optional volume for the logs of tor.
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

## Additional stuff

After running this container, take a look at the tasks listed at [community.torproject.org/relay/setup/post-install](https://community.torproject.org/relay/setup/post-install).
