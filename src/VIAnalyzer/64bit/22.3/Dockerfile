# Get base image
FROM danyallard/labview:22.3-64bit

ENV VIAN_RELEASED https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2022-vi-analyzer-toolkit/22.3/released

# Download and Install VI Analyzer
WORKDIR "/Program Files/National Instruments/NI Package Manager"
RUN  nipkg.exe feed-add --name=ni-labview-2022-vi-analyzer-toolkit-released %VIAN_RELEASED% &&\
     nipkg.exe update &&\
     nipkg.exe install --accept-eulas --yes ni-labview-2022-vi-analyzer-toolkit
