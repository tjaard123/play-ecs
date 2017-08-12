# Use the build image to build the dotnet application
docker build -t build-image -f Dockerfile.build

# Create a container from your image and copy your built application out
docker create --name build-container build-image
docker cp build-container:/out ./bin/Release/PublishOutput