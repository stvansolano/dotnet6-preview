FROM mcr.microsoft.com/dotnet/nightly/sdk:6.0.100-preview.7

# export DOTNET_ROOT=$HOME/dotnet && export PATH=$PATH:$HOME/dotnet

ENTRYPOINT /bin/sh -c "trap : TERM INT; sleep 9999999999d & wait"

# docker build --pull --rm -f "net6.Dockerfile" .  -t stvansolano/dotnet6-dev:preview
# docker run --rm -d stvansolano/dotnet6-dev:preview
# docker run --rm -d stvansolano/dotnet6-dev:preview -e DOTNET_ROOT=$HOME/dotnet -e PATH=$PATH:$HOME/dotnet
# docker run --rm -it stvansolano/dotnet6-dev:preview /bin/bash
# docker run --rm stvansolano/dotnet6-dev:preview
# docker push stvansolano/dotnet6-dev:preview