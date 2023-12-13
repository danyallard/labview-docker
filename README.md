# LabVIEW Docker

This repo contains docker files for building LabVIEW 2021 and 2022 Docker images

LabVIEW 2023 not supported yet due to error installing the latest NI Package Manager

[![FULL Docker Image](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-full.yml/badge.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-full.yml)

[![NIPM Docker Image](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-nipm.yml/badge.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-nipm.yml)

[![LabVIEW 2021 32bit Docker](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-labview.yml/badge.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-labview.yml)

[![VIAN 2021 32bit Docker](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-vian.yml/docker.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-vian.yml)

[![UTF 2021 32bit Docker](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-utf.yml/badge.svg)](https://github.com/danyallard/labview-docker/actions/workflows/docker-image-utf.yml)


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
