# .Net Core on a container
https://docs.docker.com/engine/examples/dotnetcore/


## SDK on Mac OSX
1. Install SDK
[link](https://www.microsoft.com/net/learn/get-started/macos)

Create an app
```
dotnet new console -o myApp
cd myApp
```
> Following steps dwell on the matters of creating and executing a simple console app


## Visual Studio for Mac Steps

from the tutorial [https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-web-api-mac](https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-web-api-mac)


## Command Line Steps 

### Create project
1. Put project creation commands in here
```
dotnet new webapi <project-name>
```

### Entity Framework Dependencies
2. Once the project is created, install the dependencies, one must be inside the folder with the <project-name>.csproj file
```
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools.DotNet
```
In order to make sure it all went ok, run the following command
```
dotnet ef 
```
A screen like this should appear 
```

                     _/\__
               ---==/    \\
         ___  ___   |.    \|\
        | __|| __|  |  )   \\\
        | _| | _|   \_/ |  //|\\
        |___||_|       /   \\\/\\

Entity Framework Core .NET Command Line Tools 2.0.1-rtm-125

Usage: dotnet ef [options] [command]

Options:
  --version        Show version information
  -h|--help        Show help information
  -v|--verbose     Show verbose output.
  --no-color       Don't colorize output.
  --prefix-output  Prefix output with level.

Commands:
  database    Commands to manage the database.
  dbcontext   Commands to manage DbContext types.
  migrations  Commands to manage migrations.

Use "dotnet ef [command] --help" for more information about a command.
```
