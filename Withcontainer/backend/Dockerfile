# Use official .NET 6 SDK image for building the application
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy the entire source code to the container
COPY . .

# Restore the dependencies (via NuGet)
RUN dotnet restore

# Publish the application (this compiles and optimizes the app)
RUN dotnet publish -c Release -o /app/publish

# Use a runtime-only image for running the application
FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app

# Copy the published application from the build stage
COPY --from=build /app/publish .

# Expose the port the app will run on (5000 in your case)
EXPOSE 5000

# Set the ASP.NET Core URL environment variable
ENV ASPNETCORE_URLS=http://*:5000

# Run the application (replace with your actual DLL name)
CMD ["dotnet", "WebApi.dll"]

