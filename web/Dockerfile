FROM microsoft/aspnetcore
WORKDIR /app
COPY bin/Debug/netcoreapp1.1/publish .
ENTRYPOINT ["dotnet", "web.dll"]