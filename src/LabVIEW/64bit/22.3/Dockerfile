# Get base image
FROM danyallard/nipm:22.8

ENV LV_RELEASED https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2022/22.3/released

WORKDIR "/Program Files/National Instruments/NI Package Manager"

# Download, Install LabVIEW and Enable TCP Server
RUN nipkg.exe feed-add --name=ni-labview-2022-core-en-2022-released %LV_RELEASED% &&\
    nipkg.exe update &&\
    powershell -Command New-Item 'C:\Program Files\National Instruments\LabVIEW 2022' -ItemType Directory &&\
    echo server.tcp.enabled=True>"C:\Program Files\National Instruments\LabVIEW 2022\LabVIEW.ini" &&\
    setx /M PATH "%PATH%;C:\Program Files (x86)\National Instruments\Shared\License Manager" &&\
    nipkg.exe install --accept-eulas --yes ni-labview-2022-core-en & exit 0

# Download and Install LabVIEW CLI
RUN nipkg.exe install --accept-eulas --yes ni-labview-command-line-interface-x86 &&\
    setx /M PATH "%PATH%;C:\Program Files (x86)\National Instruments\Shared\LabVIEW CLI"
