ARG DOTNET_SDK_VERSION=7.0.410
ARG DOTNET_RUNTIME_VERSION=7.0.20

FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_SDK_VERSION} AS build
WORKDIR /source
COPY *.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app --no-restore --self-contained false

FROM mcr.microsoft.com/dotnet/runtime:${DOTNET_RUNTIME_VERSION}
ENV DOTNET_EnableDiagnostics=0
WORKDIR /app
COPY --from=build --chown=10001:10001 /app .
USER 10001
ENTRYPOINT ["dotnet", "Worker.dll"]
