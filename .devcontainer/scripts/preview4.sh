#!/bin/bash

mkdir $HOME/dotnet \
    && curl https://download.visualstudio.microsoft.com/download/pr/f5c00d7a-e1c8-494a-a88b-9ed1dc62249e/8438122af4fd928900a0ebf129c6c1d6/dotnet-sdk-6.0.100-preview.4.21255.9-linux-x64.tar.gz -o $HOME/dotnet/dotnet-sdk-6.gz \
    && tar zxf $HOME/dotnet/dotnet-sdk-6.gz -C $HOME/dotnet \
    && export DOTNET_ROOT=$HOME/dotnet \
    && export PATH=$PATH:$HOME/dotnet