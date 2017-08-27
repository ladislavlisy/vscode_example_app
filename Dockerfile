FROM microsoft/aspnetcore
LABEL Name=vscode_example_app Version=0.0.0
WORKDIR /app
COPY ./publish .
RUN apt-get update && apt-get install -my wget gnupg
RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
# Installing Node.js
RUN apt-get install nodejs
ENTRYPOINT ["dotnet", "vscode_example_app.dll"]