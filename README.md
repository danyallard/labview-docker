# LabVIEW Docker

This repo contains docker files for building LabVIEW 2021 and 2022 Docker images

LabVIEW 2023 not supported yet due to error installing the latest NI Package Manager

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/danyallard/labview-docker/docker-image-full.yml?logo=Docker&label=Full)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/danyallard/labview-docker/docker-image-nipm.yml?logo=Docker&label=NIPM)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/danyallard/labview-docker/docker-image-nipm-23-8.yml?logo=Docker&label=NIPM%2023.8)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/danyallard/labview-docker/docker-image-labview.yml?logo=Docker&label=LabVIEW)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/danyallard/labview-docker/docker-image-vian.yml?logo=Docker&label=VI%20Analyzer)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/danyallard/labview-docker/docker-image-utf.yml?logo=Docker&label=UTF)

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

