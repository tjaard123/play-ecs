# Method 1
# Use the build image to build the dotnet application
docker build -t build-image -f Dockerfile.build .

# Create a container from your image and copy your built application out
docker create --name build-container build-image
docker cp build-container:/out ./bin/Release/PublishOutput


# Method 2
# No Dockerfile, simply issue a command to aspnetcore-build image
docker run -it -v .:/app --workdir /app microsoft/aspnetcore-build bash -c "dotnet restore && dotnet publish -c Release -o ./bin/Release/PublishOutput"