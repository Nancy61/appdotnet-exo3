FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env

WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore DotNet.Docker.csproj

# Copy everything else and build
COPY . ./
RUN dotnet publish -o /app/out -c release
#-o dit où il faut publish et - c dit le type de publish que je souhaite faire

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "DotNet.Docker.dll"]

