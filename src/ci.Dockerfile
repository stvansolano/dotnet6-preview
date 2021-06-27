FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine as base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/nightly/sdk:6.0.100-preview.5 as build
COPY . /src
WORKDIR /src/WebApi
RUN ls
RUN dotnet build "WebApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApi.dll"]

# docker build --pull --rm -f "ci.Dockerfile" . -t stvansolano/dotnet6-web-api:ci
# docker build -f src/ci.Dockerfile src -t stvansolano/dotnet6-dev:web-api