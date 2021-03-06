# Docker Basic Studyings on a Sunday Morning

This file is supposed to comprehend the study progress for docker on linux running a Microsoft Web API and Sql Server set

The main goals here is to go as far as it is possible for considering the porting of an entire solution Web API with ODATA and Entity Framework 6 to a Linux/Mac Docker Host

Second goal is to find alternatives and point which of the tech set aren't supported

Third goal is to identify the 'free tier' limitations

Forth goal is to see if it is possible to do it for windows forms and/or windows services

## To Do

- [x] create ubuntu 16.04 virtual box
- [x] install docker
- [x] find out about installation tutorials to pull .net 
- [x] find out about installation tutorials to pull asp.net 
- [x] find out about installation tutorials to pull sql server 
- [ ] follow compose + asp.net + sql server 
- [ ] find first app out WebAPI=>EF=>SQLServer



## Steps Taken 

### Environment 

Ubuntu 16.04 on Oracle Virtual Box
`vboxmanage showvminfo dok3`

```
Name:            dok3
Groups:          /
Guest OS:        Ubuntu (64-bit)
UUID:            9267d1e1-dc5c-41e6-9f7b-848e96a2ed2d
Config file:     /v/vms/dok3/dok3.vbox
Snapshot folder: /v/vms/dok3/Snapshots
Log folder:      /v/vms/dok3/Logs
Hardware UUID:   9267d1e1-dc5c-41e6-9f7b-848e96a2ed2d
Memory size:     3848MB
Page Fusion:     off
VRAM size:       16MB
CPU exec cap:    100%
HPET:            off
Chipset:         piix3
Firmware:        BIOS
Number of CPUs:  1
```


### Sql Server
Documentation for container `microsoft/mssql-server-linux` explicitly points that the only supported linux distros are Red Hat, SUSE and Ubuntu. A test has been performed with CentOS 7, but pulling sql server image has been met with a failure response.

If when running the command `docker pull microsoft/mssql-server-linux` you are received with the message `Cannot connect to the Docker daemon. Is the docker daemon running on this host?`, just elevate the `pull` command with `sudo`

`docker images` will produce the following after the installations of **.Net**, **.Net Core** and **Sql Server**

```
root@dok2:~# docker images
REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
microsoft/aspnetcore-build     latest              5db4a5a07801        45 hours ago        1.852 GB
microsoft/dotnet               latest              9a871a883420        4 days ago          1.635 GB
microsoft/mssql-server-linux   latest              a6a93443872a        7 weeks ago         1.427 GB
``` 
Probaly the installation of the .net image was a little premature, but it was good enough to prove the concept of a working .net core container 

# Tutorials

## [QuickStart: Compose and ASP.NET Core with Sql Server](https://docs.docker.com/compose/aspnet-mssql-compose/)

If running inside an Oracle Virtual Box machine, make sure the guest additions are installed. Shared folders is going to be the feature you want up and running if, for instance, one feels like editing code outside the guest box. Run `apt install virtualbox-guest-dkms` in order to accomplish that. 


This will create a sample .net core app 
`docker run -v ${PWD}:/app --workdir /app microsoft/aspnetcore-build:lts dotnet new mvc --auth Individual
`
The result should be
```
The template "ASP.NET Core Web App" was created successfully.
This template contains technologies from parties other than Microsoft, see https://aka.ms/template-3pn for details.
```

Create the Docker file according to the tutorial and then `ll` should them provide: 
```
total 176
drwxr-xr-x 6 root root   4096 Sep 17 14:19 wwwroot
drwxr-xr-x 9 root root   4096 Sep 17 14:19 .
drwxr-xr-x 6 root root   4096 Sep 17 14:19 Views
drwxr-xr-x 2 root root   4096 Sep 17 14:19 Services
drwxr-xr-x 4 root root   4096 Sep 17 14:19 Models
drwxr-xr-x 3 root root   4096 Sep 17 14:19 Data
drwxr-xr-x 2 root root   4096 Sep 17 14:19 Controllers
-rwxr--r-- 1 root root   3123 Sep 17 14:19 Startup.cs
-rwxr--r-- 1 root root    566 Sep 17 14:19 Program.cs
-rwxr--r-- 1 root root 106496 Sep 17 14:19 app.db
-rwxr--r-- 1 root root   2079 Sep 17 14:19 app.csproj
-rwxr--r-- 1 root root    207 Sep 17 14:19 bower.json
-rwxr--r-- 1 root root    628 Sep 17 14:19 bundleconfig.json
-rwxr--r-- 1 root root    191 Sep 17 14:19 appsettings.json
-rwxr--r-- 1 root root    178 Sep 17 14:19 appsettings.Development.json
-rwxr--r-- 1 root root     36 Sep 17 14:19 .bowerrc
drwxr-xr-x 2 root root   4096 Sep 17 14:15 app
-rw-r--r-- 1 root root    184 Sep 17 14:03 Dockerfile
drwxr-xr-x 3 root root   4096 Sep 17 13:44 ..
```

Go ahead and open this project with Visual Studio Code. Check out the generated code and compare with 






# Recommended Reading and Reference Material 

## Docker
- [Containers 101 : Docker Fundamentals by Chenxi Wang](https://www.infoworld.com/article/3077875/linux/containers-101-docker-fundamentals.html)

- [Installation and Usage - by How To Forge](https://www.howtoforge.com/tutorial/docker-installation-and-usage-on-ubuntu-16.04/)

- [Docker Compose Install](https://docs.docker.com/compose/install/)

- [Docker Compose Github Page](https://github.com/docker/compose)

## NodeJs 
- [For Node.JS Environment](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)

## .NET
- [Install .NET and build your first app on Docker](https://www.microsoft.com/net/core#dockercmd)

## Sql Server
- [SQL Server Docker container with Microsoft SQL Server for Linux images by Yannick Jaquier](http://blog.yannickjaquier.com/sql-server/sql-server-docker-container-sql-server-linux.html)
This is a more how to log and where it would be a good place for troubleshooting. Mostly considers that the reader is comfident within docker world.

- [SQL Server Docker Official Page](https://hub.docker.com/r/microsoft/mssql-server-linux/)

- [Sql Server for Docker Official Microsoft Page](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker)

## Full-Stackoverflow
- [How to edit file after I shell to a docker container?](https://stackoverflow.com/questions/30853247/how-to-edit-file-after-i-shell-to-a-docker-container)





Central de Mensagens 
-- Exame 1 
  -- Ticket 1 do Exame 1
  -- Ticket 2 do Exame 1 
  -- Ticket 3 do Exame 1
-- Exame 2
  -- Ticket 1 do Exame 2
  -- Ticket 2 do Exame 2 
  -- Ticket 3 do Exame 2
-- Exame 3