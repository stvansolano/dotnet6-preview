FROM alpine:latest

# Add curl
RUN apk --no-cache add curl

ENV HOME=/usr/local/bin

# Install .NET
RUN mkdir $HOME/dotnet \
    && curl https://download.visualstudio.microsoft.com/download/pr/f5c00d7a-e1c8-494a-a88b-9ed1dc62249e/8438122af4fd928900a0ebf129c6c1d6/dotnet-sdk-6.0.100-preview.4.21255.9-linux-x64.tar.gz -o $HOME/dotnet/dotnet-sdk-6.0.100-preview.4.21255.9-linux-x64.tar.gz \
    && tar zxf $HOME/dotnet/dotnet-sdk-6.0.100-preview.4.21255.9-linux-x64.tar.gz -C $HOME/dotnet

RUN chmod +x root $HOME/dotnet

ENV PATH="${PATH}:$HOME/dotnet"
RUN export PATH=$PATH

ENTRYPOINT [ "sleep", "infinity" ]

# docker build --pull --rm -f "src/net6.Dockerfile" .  -t stvansolano/dotnet6-dev:preview4
# docker push stvansolano/dotnet6-dev:preview4