# Get base image
FROM danyallard/nipm:22.8

ENV LV_RELEASED https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2021-x86/21.1/released

WORKDIR "/Program Files/National Instruments/NI Package Manager"

# Download, Install LabVIEW and Enable TCP Server and Reboot
RUN nipkg.exe feed-add --name=ni-labview-2021-core-x86-en-2021-released %LV_RELEASED% &&\
    nipkg.exe update &&\
    powershell -Command New-Item 'C:\Program Files (x86)\National Instruments\LabVIEW 2021' -ItemType Directory &&\
    echo server.tcp.enabled=True>"C:\Program Files (x86)\National Instruments\LabVIEW 2021\LabVIEW.ini" &&\
    setx /M PATH "%PATH%;C:\Program Files (x86)\National Instruments\Shared\License Manager" &&\
    nipkg.exe install --accept-eulas --yes ni-labview-2021-core-x86-en & exit 0 &&\
    shutdown /r

# Download and Install LabVIEW CLI
# Set environment path to call LabVIEW CLI
RUN nipkg.exe install --accept-eulas --yes ni-labview-command-line-interface-x86 &&\
    setx /M PATH "%PATH%;C:\Program Files (x86)\National Instruments\Shared\LabVIEW CLI"
