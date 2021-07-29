#!/bin/bash

mkdir $HOME/dotnet \
    && curl https://download.visualstudio.microsoft.com/download/pr/45f9f84c-dbe6-458e-bea1-c1e931802486/995edcbcd852a07b0a285626f30afb33/dotnet-sdk-6.0.100-preview.6.21355.2-linux-x64.tar.gz -o $HOME/dotnet/dotnet-sdk-6.gz \
    && tar zxf $HOME/dotnet/dotnet-sdk-6.gz -C $HOME/dotnet \
    && export DOTNET_ROOT=$HOME/dotnet \
    && export PATH=$PATH:$HOME/dotnet