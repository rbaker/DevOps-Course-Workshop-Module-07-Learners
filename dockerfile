FROM mcr.microsoft.com/dotnet/sdk:5.0 as build

WORKDIR /app

COPY DotnetTemplate.Web .

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs

RUN dotnet build
RUN npm install
RUN npm run build

RUN dotnet publish -o /dist

FROM mcr.microsoft.com/dotnet/aspnet:5.0

EXPOSE 5000

WORKDIR /app

COPY --from=build /dist/ .

ENTRYPOINT [ "dotnet", "DotnetTemplate.Web.dll" ]