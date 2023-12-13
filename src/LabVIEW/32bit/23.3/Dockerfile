# Get base image
FROM danyallard/nipm:23.8

ENV LV_RELEASED https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2023-x86/23.3/released

WORKDIR "/Program Files/National Instruments/NI Package Manager"

# Install msdotnet4x
RUN winget install Microsoft.DotNet.Framework.DeveloperPack_4

# Download, Install LabVIEW and Enable TCP Server
RUN nipkg.exe feed-add --name=ni-labview-2023-core-x86-en-2023-released %LV_RELEASED% &&\
    nipkg.exe update &&\
    powershell -Command New-Item 'C:\Program Files (x86)\National Instruments\LabVIEW 2023' -ItemType Directory &&\
    echo server.tcp.enabled=True>"C:\Program Files (x86)\National Instruments\LabVIEW 2023\LabVIEW.ini" &&\
    setx /M PATH "%PATH%;C:\Program Files (x86)\National Instruments\Shared\License Manager" &&\
    nipkg.exe install --accept-eulas --yes ni-labview-2023-core-x86-en & exit 0

# Download and Install LabVIEW CLI
RUN nipkg.exe install --accept-eulas --yes ni-labview-command-line-interface-x86 &&\
    setx /M PATH "%PATH%;C:\Program Files (x86)\National Instruments\Shared\LabVIEW CLI"

WORKDIR "/Program Files (x86)3/National Instruments/Shared/License Manager/bin"
ADD https://github.com/danyallard/labview-docker/tree/main/src/LabVIEW/activate_labview.ps1 activate_labview.ps1
