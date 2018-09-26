FROM microsoft/dotnet:2.1-sdk AS build-env
WORKDIR /app
COPY . ./
RUN dotnet publish -c Release -o out -r linux-x64

FROM microsoft/dotnet:2.1-runtime 
WORKDIR /app
COPY --from=build-env /app/out ./
ENTRYPOINT ["dotnet", "hello.dll"]