FROM debian
#RUN groupadd -r dotneter && useradd -r -g dotneter dotneter

# Add curl
RUN apt update && apt upgrade  \
    && apt install curl --assume-yes

# Install .NET
COPY /scripts /tmp
RUN sh /tmp/preview5.sh

ENV PATH="${PATH}:$HOME/dotnet"
RUN export PATH=$PATH \
    && chown -R root $HOME/dotnet

ENTRYPOINT exec /bin/sh -c "trap : TERM INT; sleep 9999999999d & wait"

# docker build --pull --rm -f "net6.Dockerfile" .  -t stvansolano/dotnet6-dev:preview5
# docker push stvansolano/dotnet6-dev:preview5
# docker run --rm -it  stvansolano/dotnet6-dev:preview5 bash <