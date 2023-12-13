# Get Windows Base Image
FROM mcr.microsoft.com/windows:ltsc2019

RUN net accounts /maxpwage:unlimited
RUN net user Container /add /expire:never /passwordreq:no
RUN net localgroup Administrators Container /add

#USER Container

WORKDIR /users/public/downloads

# Download NI Package Manager and Install
ADD https://download.ni.com/support/nipkg/products/ni-package-manager/installers/NIPackageManager22.8.0.exe NIPackageManager22.8.0.exe

RUN NIPackageManager22.8.0.exe --passive --accept-eulas --prevent-reboot

# RUN del NIPackageManager22.8.0.exe

# Disable Packages Cache
WORKDIR "/ProgramData/National Instruments/NI Package Manager/Settings"
RUN echo [nipkg]>>nipkg.ini &&\
    echo cachepackages=false>>nipkg.ini

# Install NI Package Builder
WORKDIR "/Program Files/National Instruments/NI Package Manager"
RUN nipkg.exe feed-add --name=ni-package-builder-22-5-released https://download.ni.com/support/nipkg/products/ni-p/ni-package-builder/22.5/released &&\
    nipkg.exe update &&\
    setx /M PATH "%PATH%;C:\Program Files (x86)\National Instruments\Package Builder"  &&\
    nipkg.exe install --accept-eulas --yes ni-package-builder
