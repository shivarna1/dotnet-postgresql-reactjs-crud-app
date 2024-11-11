#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install .NET 6 SDK
echo "Installing .NET 6 SDK..."
sudo add-apt-repository -y ppa:dotnet/backports
sudo apt update
sudo apt install -y dotnet-sdk-6.0
dotnet --version

# Install PostgreSQL
echo "Installing PostgreSQL..."
sudo apt install -y postgresql postgresql-contrib
sudo systemctl enable postgresql
sudo systemctl restart postgresql

# Configure PostgreSQL
echo "Configuring PostgreSQL..."
sudo -iu postgres psql -c "ALTER USER postgres PASSWORD 'root';"
sudo sed -i 's/local   all             postgres                                peer/local   all             postgres                                md5/' /etc/postgresql/*/main/pg_hba.conf
sudo systemctl restart postgresql

# Set up PostgreSQL database and sample data
echo "Setting up PostgreSQL database and inserting sample data..."
sudo -iu postgres psql <<EOF
CREATE DATABASE testdb;
\c testdb
CREATE TABLE IF NOT EXISTS public.users
(
    id serial primary key,
    email VARCHAR(40) not null,
    first_name VARCHAR(40) not null,
    last_name VARCHAR(40) not null
);
INSERT INTO public.users (email, first_name, last_name)
VALUES 
    ('john.doe@example.com', 'John', 'Doe'),
    ('jane.smith@example.com', 'Jane', 'Smith'),
    ('alex.jones@example.com', 'Alex', 'Jones'),
    ('emily.watson@example.com', 'Emily', 'Watson'),
    ('michael.brown@example.com', 'Michael', 'Brown');
EOF

# Install Node.js, npm, and PM2
echo "Installing Node.js, npm, and PM2..."
sudo apt install -y nodejs npm
sudo npm install -g pm2

# Add .NET packages and perform cleanup
echo "Adding .NET packages and clearing NuGet cache..."
# dotnet add package Microsoft.EntityFrameworkCore.Analyzers --version 7.0.2
# dotnet add package Microsoft.CodeAnalysis --version 4.2.0
# dotnet restore
# dotnet nuget locals all --clear

echo "Installation complete!"

