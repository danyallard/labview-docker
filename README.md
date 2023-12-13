# LabVIEW Docker

This repo contains docker files for building LabVIEW 2021 and 2022 Docker images

LabVIEW 2023 not supported yet due to error installing the latest NI Package Manager

[![NIPM Docker Image](https://github.com/danyallard/labview-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image.yml)
[![LabVIEW 2021 32bit Docker](https://github.com/danyallard/labview-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image.yml)
[![VIAN 2021 32bit Docker](https://github.com/danyallard/labview-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image.yml)
[![UTF 2021 32bit Docker](https://github.com/danyallard/labview-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image.yml)

## Docker Hierarchy

```mermaid
graph TB
ID-1[NIPM]
ID-2[LabVIEW 202x]
ID-3[VI Analyzer]
ID-4[Unit Test Framework]
ID-1 --> ID-2
ID-2 --> ID-3
ID-2 --> ID-4
```
