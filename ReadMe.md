# GRYVATorRelay

## Purpose

Represents a [Tor](https://www.torproject.org/)-server.

## Usage

### Volumes

Using volumes is recommended to preserve data. The available folder for a volume are:

- `/userhome/.tor`: Folder for all stored data and configuration of the hosted server.
- `/var/log/tor`: Folder for Log-files.

### Environment-variables

There are currently no environment-variables available.

### Example

See `docker-compose.example.yml` for an example how to use this image.

## Development

### Branching-system

This repository applies the [GitFlowSimplified](https://projects.aniondev.de/CommonUtilities/Templates/ProjectTemplates/-/blob/main/Templates/Conventions/BranchingSystem/GitFlowSimplified.md)-branching-system.

### Build image

The image can be built using the following command:

``` sh
docker image build --no-cache --pull --force-rm --progress plain --build-arg EnvironmentStage=Development --tag grytorrelay:latest .
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
