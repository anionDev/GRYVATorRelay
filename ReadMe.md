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
- `relaybandwidthrate`

All of these environment-variables are required.

### Example

See `docker-compose.example.yml` for an example how to use this image.

### Build image

The image can be built using the following command:

``` sh
docker image build --force-rm --progress plain --build-arg EnvironmentStage=Development --tag gryvatorrelay:latest .
```

The image can also be built using the following command which uses no cache:

``` sh
docker image build --no-cache --pull --force-rm --progress plain --build-arg EnvironmentStage=Development --tag gryvatorrelay:latest .
```

The environment-stage can have the one of the following values:

- `Development`
- `QualityManagement`
- `Productive`

### Test image

The built image can be tested using the following command:

``` sh
docker-compose -f docker-compose.example.yml -p GRYVATorRelay up --remove-orphans --force-recreate
```

After executing this command the first time your container may terminate and you may see an `eula.txt`-file in the `./Volumes/Configuration`-folder. You have to edit this file accordingly to indicate that you accept the end-user license agreement and execute the command again to run the application. Now the container will remain running and uses your world-data stored in `./Volumes/Data` or creates a new world in this folder if the folder is empty.

## Development

### Branching-system

This repository applies the [GitFlowSimplified](https://projects.aniondev.de/CommonUtilities/Templates/ProjectTemplates/-/blob/main/Templates/Conventions/BranchingSystem/GitFlowSimplified.md)-branching-system.

## Additional stuff

After running this container, take a look at the tasks listed at [community.torproject.org/relay/setup/post-install](https://community.torproject.org/relay/setup/post-install).
