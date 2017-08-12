# Docker | AWS | Web

A simple example web app using docker & aws's container service

I found the official AWS guide to be pretty good:
http://docs.aws.amazon.com/AmazonECR/latest/userguide/ECR_GetStarted.html

## Dotnet docker images
microsoft/dotnet image is the base image
microsoft/aspnetcore image adds

1. Environment variable to allow external access for Kestrel, which is by default bound to localhost
2. Exposes port 80

Enabling your Dockerfile to be super lightweight:

```docker
FROM microsoft/aspnetcore

# Create a working directory called app on the container
WORKDIR /app

# Copy published aspnet core app to the working directory
COPY bin/Debug/netcoreapp1.1/publish .

# Run your application with dotnet inside the container
ENTRYPOINT ["dotnet", "yourproject.dll"]
```

---
Looks like you now have Windows docker images?

https://github.com/Microsoft/dotnet-framework-docker-samples/tree/master/dotnetapp-4.6.2

https://www.hanselman.com/blog/ExploringASPNETCoreWithDockerInBothLinuxAndWindowsContainers.aspx

## Nginx

https://www.sep.com/sep-blog/2017/02/27/nginx-reverse-proxy-to-asp-net-core-separate-docker-containers/


## CI

Build should also be dockerized?