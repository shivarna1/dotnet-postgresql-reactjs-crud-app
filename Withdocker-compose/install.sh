#!/bin/bash

echo "Task 1: Updating package list..."
sudo apt update

echo "Task 2: Installing Docker..."
sudo apt install docker.io -y
sudo chown $USER /var/run/docker.sock
docker ps

echo "Task 3: Installing Docker Compose..."
sudo apt install docker-compose -y
