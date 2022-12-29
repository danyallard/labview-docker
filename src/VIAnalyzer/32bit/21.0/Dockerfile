# Get base image
FROM danyallard/labview:21.0-32bit

ENV VIAN_RELEASED https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2021-vi-analyzer-toolkit-x86/21.0/released

# Download and Install VI Analyzer
WORKDIR "/Program Files/National Instruments/NI Package Manager"
RUN  nipkg.exe feed-add --name=ni-labview-2021-vi-analyzer-toolkit-x86-released %VIAN_RELEASED% &&\
     nipkg.exe update &&\
     nipkg.exe install --accept-eulas --yes ni-labview-2021-vi-analyzer-toolkit-x86
