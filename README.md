### dotnet-postgresql-reactjs-crud-app
A CRUD application using .NET for the backend, PostgreSQL as the database, and React.js for the frontend.

# Clone repo
# frontend:-
```
vim /home/ubuntu/dotnet-postgresql-reactjs-crud-app/frontend/src/services`
  const USER_API_BASE_URL = "http://3.108.254.229:9080/api/v1/users";  //publicIP
```
```
  npm install
  npm start
```

# backend:-
```
vim appsettings.json

{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "ConnectionStrings": {
    "ApiDatabase": "Host=3.108.254.229:5432; Database=testdb; Username=postgres; Password=root" // public ip
  },
 "AppSettings": {
    "Hostname": "0.0.0.0",
    "Port": "9080"
  }
}
```
```
cd /etc/postgresql/16/main
  $ sudo vim postgresql.conf 
  listen_addresses = '*'		# what IP address(es) to listen on;

  $ sudo vim  pg_hba.conf

  # IPv4 local connections:
  host    all             all             0.0.0.0/0               md5

  host    replication     all             0.0.0.0/0               md5

 $ sudo systemctl restart postgres 
```
```
dotnet build
dotnet run
```
If any issue then show logs:-
$ cd /var/log/postgresql 
$ cat postgresql-16-main.log

# dotnet-postgresql-reactjs-crud-app
pm2 start npm --name "react" -- start

git remote set-url origin git@github.com:shivarna1/dotnet-postgresql-reactjs-crud-app.git

