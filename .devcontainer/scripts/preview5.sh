mkdir $HOME/dotnet \
    && curl https://download.visualstudio.microsoft.com/download/pr/68e2a2f9-aab4-40c3-8abc-e22c1e34afef/8c5b1168020496e5f3bc84b7c4ecaf2d/dotnet-sdk-6.0.100-preview.5.21302.13-linux-musl-x64.tar.gz -o $HOME/dotnet/dotnet-sdk-6.gz \
    && tar zxf $HOME/dotnet/dotnet-sdk-6.gz -C $HOME/dotnet

chmod +x root $HOME/dotnet

export DOTNET_ROOT=$HOME/dotnet \
    && export PATH=$PATH:$HOME/dotnet