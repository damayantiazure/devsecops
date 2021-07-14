FROM whyellow/build-netcore-sonar:latest
ARG source
WORKDIR /app
EXPOSE 80
COPY ${source:-obj/Docker/publish} .
ENTRYPOINT ["dotnet", "MyHealth.Web.dll"]
