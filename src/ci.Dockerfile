FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine as base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/nightly/sdk:6.0.100-preview.7 as build
COPY . /src
WORKDIR /src/ConsoleApp
RUN ls
RUN dotnet build "ConsoleApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ConsoleApp.csproj" -c Release -o /app/publish

FROM base AS final
RUN apk update && apk add curl
WORKDIR /app
COPY --from=publish /app/publish .
#EXPOSE 80
ENTRYPOINT ["dotnet", "ConsoleApp.dll"]

# docker build --pull --rm -f "ci.Dockerfile" . -t stvansolano/dotnet6-web-api:ci
# docker build -f src/ci.Dockerfile src -t stvansolano/dotnet6-dev:web-api