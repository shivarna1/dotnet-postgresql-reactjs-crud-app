#!/bin/bash

echo "Task 1: Updating package list..."
sudo apt update

echo "Task 2: Installing .NET 6 SDK..."
sudo add-apt-repository -y ppa:dotnet/backports
sudo apt update
sudo apt install -y dotnet-sdk-6.0
dotnet --version


echo "Task 3: Installing PostgreSQL..."
sudo apt install -y postgresql postgresql-contrib
sudo systemctl enable postgresql
sudo systemctl restart postgresql


echo "Task 4: Installing Node.js and npm..."
sudo apt install -y nodejs npm


echo "Task 5: Updating package list again..."
sudo apt-get update


echo "Task 6: Installing Docker..."
sudo apt install docker.io -y
sudo chown $USER /var/run/docker.sock
docker ps


echo "Task 7: Installing Docker Compose..."
sudo apt install docker-compose -y
