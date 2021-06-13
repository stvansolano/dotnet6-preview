ARG VARIANT=focal
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

# Options
ARG INSTALL_ZSH="true"
ARG UPGRADE_PACKAGES="false"
ARG ENABLE_NONROOT_DOCKER="true"
ARG SOURCE_SOCKET=/var/run/docker-host.sock
ARG TARGET_SOCKET=/var/run/docker.sock
ARG USERNAME=coder
ARG USER_UID=1001
ARG USER_GID=$USER_UID
COPY library-scripts/*.sh /tmp/library-scripts/
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" \
    && /bin/bash /tmp/library-scripts/docker-debian.sh "${ENABLE_NONROOT_DOCKER}" "${SOURCE_SOCKET}" "${TARGET_SOCKET}" "${USERNAME}" \
#
    # ****************************************************************************
    # * TODO: Add any additional OS packages you want included in the definition *
    # * here. We want to do this before cleanup to keep the "layer" small.       *
    # ****************************************************************************
    # && apt-get -y install --no-install-recommends <your-package-list-here> \
    #
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

EXPOSE 5000
EXPOSE 5001
EXPOSE 80
EXPOSE 443

EXPOSE 8080
EXPOSE 8443

RUN apt-get update; \
    apt-get install -y wget;
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb; \
    apt-get update; \
    apt-get install -y apt-transport-https && apt-get update; \
    dpkg -i packages-microsoft-prod.deb && apt-get update; \
    apt-get install -y dotnet-sdk-5.0

RUN dotnet tool install dotnet-ef --tool-path $HOME/dotnet/tools

# Code-server install
RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN [ "/usr/local/share/docker-init.sh" ]

# To have systemd start code-server now and restart on boot:
# RUN sudo systemctl enable --now code-server@$USER
ENTRYPOINT ["code-server", "--host", "0.0.0.0"]

# docker build -f ".devcontainer/code-server.Dockerfile" -t stvansolano/code-server:latest .devcontainer
# docker image rm <image-name>