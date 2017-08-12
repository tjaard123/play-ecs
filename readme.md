# Docker | AWS | Web

A simple example web app using docker & aws's container service

I found the official AWS guide to be pretty good:
http://docs.aws.amazon.com/AmazonECR/latest/userguide/ECR_GetStarted.html


Trying to get the repo image to ECS is proving a pain

Learnings:
Need to build and publish the dotnet app.  Any app will have similar stuff.  Dotnet has an image specifically for build
Tried:
1. Restore and run out of runtime image, probably not best practice
1. Dockerfile.build - still needs a lot of manual, would need a shell script to copy out of build etc.  See older version of dotnet build image: https://github.com/aspnet/aspnet-docker/blob/d296d012c42d6ced6d4e6a95ae0d85a46043d1bf/README.aspnetcore-build.md
1. New docker version can have two images inside a Dockerfile, this would be awesome but AWS doesn't support this version yourproject.  See this version of build image: https://github.com/aspnet/aspnet-docker/tree/e45a99d296e6a92672cdff39911f523abe1e9694/README.aspnetcore-build.md
1. Tried mounting a local drive and simply do docker run with -v but can't get to sharing the drive on Windows.  This can be done with a compose as well but trying to keep it light weight.  Maybe mounting has too much dependency on OS


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