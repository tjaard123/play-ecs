# Runtime image
FROM microsoft/aspnetcore-build
WORKDIR /app
COPY . .
RUN dotnet restore
EXPOSE 80
# RUN dotnet run
ENTRYPOINT ["dotnet", "run"]