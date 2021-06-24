#!/bin/bash

mkdir $HOME/dotnet \
    && curl https://download.visualstudio.microsoft.com/download/pr/919880af-ab5a-4b58-8058-7baaea4a09d1/4fe186d747cf416cbdc83fd8354e15ea/dotnet-sdk-6.0.100-preview.5.21302.13-linux-x64.tar.gz -o $HOME/dotnet/dotnet-sdk-6.gz \
    && tar zxf $HOME/dotnet/dotnet-sdk-6.gz -C $HOME/dotnet \
    && export DOTNET_ROOT=$HOME/dotnet \
    && export PATH=$PATH:$HOME/dotnet