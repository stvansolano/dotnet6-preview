# /bin/sh
FROM alpine:latest

# Add curl
RUN apk --no-cache add curl

ENV HOME=/home

# Install .NET
COPY . /tmp
RUN sh /tmp/preview4.sh

ENV PATH="${PATH}:$HOME/dotnet"
RUN export PATH=$PATH

ENTRYPOINT [ "sleep", "infinity" ]

# docker build --pull --rm -f "net6.Dockerfile" scripts  -t stvansolano/dotnet6-dev:preview4
# docker push stvansolano/dotnet6-dev:preview4
# docker run --rm -it  stvansolano/dotnet6-dev:preview4