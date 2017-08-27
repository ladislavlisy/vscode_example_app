git remote add origin https://github.com/ladislavlisy/vscode_example_app.git

dotnet publish -o ./publish

docker build -t vscode_example_app .
docker run -p 8181:80 vscode_example_app


docker build -f Dockerfile.build -t vscode-example-app-build .
docker images
docker image rm -f vscode-example-app-build

docker create --name vscode-example-app-build-container vscode-example-app-build
docker container ls -all

docker exec -it vscode-example-app-build-container bash
docker cp vscode-example-app-build-container:/out ./publish