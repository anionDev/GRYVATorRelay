# GRYVATorRelay

## Purpose

[GRYVATorRelay](https://github.com/anionDev/GRYVATorRelay) is a docker-image for simply running a tor-relay in a docker-container.

The latest-release contains Tor v0.4.7.13.

## Usage

### Volumes

Using volumes is not required. There are 2 optional volumes:

- `/Workspace/Data`
- `/var/log/tor`

The path in the container for this log-folder is `/var/log/tor`.

### Environment-variables

The following environment-variables are supported:

- `nickname`
- `orport`
- `exitrelay`
- `socksport`
- `controlsocket`
- `contactinfo`
- `relaybandwidthrate`
- `lognotice`
- `logdebug`

All of these environment-variables are required.

### Example

See [`docker-compose.example.yml`](https://github.com/anionDev/GRYVATorRelay/blob/main/GRYVATorRelay/Other/Reference/ReferenceContent/Examples/MinimalDockerComposeFile/docker-compose.yml) for an example how to use this image.

## Additional stuff

After running this container, take a look at the tasks listed at [community.torproject.org/relay/setup/post-install](https://community.torproject.org/relay/setup/post-install).

## Development

### Development-state

![Development-state](https://img.shields.io/badge/development--state-maintenance%20updates%20only-green)

### Branching-system

This repository applies the [GitFlowSimplified](https://projects.aniondev.de/PublicProjects/Common/ProjectTemplates/-/blob/main/Conventions/BranchingSystem/GitFlowSimplified/GitFlowSimplified.md)-branching-system.

### Image-properties

The image-build-artifacts of this repository implement the [DefaultImageUsabilityRequirements](https://projects.aniondev.de/PublicProjects/Common/ProjectTemplates/-/blob/main/Conventions/ImageProperties/DefaultImageUsabilityRequirements/DefaultImageUsabilityRequirements.md)-branching-system.

### Project-Structure

This repository applies the [CommonProjectStructure](https://projects.aniondev.de/PublicProjects/Common/ProjectTemplates/-/blob/main/Conventions/RepositoryStructure/CommonProjectStructure/CommonProjectStructure.md)-project-structure.

### Versioning-system

This repository applies the [SemVerPractise](https://projects.aniondev.de/PublicProjects/Common/ProjectTemplates/-/blob/main/Conventions/Versioning/SemVerPractise/SemVerPractise.md)-versioning-system.

## License

See [License.txt](https://github.com/anionDev/GRYVATorRelay/blob/main/License.txt) for license-information.
