---
layout: single
permalink: /blog/2022/05/22/setup-your-windows-devbox-like-a-pro💻🔩🔧
title:  "Setup Your Windows Devbox Like a Pro 💻🔩🔧"
excerpt: "Config and Tools for Windows that will help you !"
date:   2022-05-22 00:37:00:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - aem
  - docker
  - docker-compose
  - wsl
  - windows
redirect_from:
  - /blog/2022/05/22/setup-your-windows-devbox-like-a-pro
---

This article follows the previous one where we have cried our [Goodbyes to Docker Destop](/blog/2022/02/01/goodbye-docker-desktop) 😭.

Let's now look at some base config you can start with when setting up you dev box for dev! Let us focus only on the base windows setup, which can be used as a foundation for any tooling specialisation.

If you are a developer, a frontend dev, backend dev, full stack or just want to know what should I have no my windows dev box as a starting point, then this article is for you.

For the best experience with Windows, before you begin experimenting and installing all sorts of tools, you are going to need some basics.

### Get some soft!

First off, you will need some proper tools to use on Windows for development. These should be at the top of your list.

* [Powershell Core 7](https://github.com/PowerShell/PowerShell/releases) - This will give you a usable cross platform shell
* [Windows Terminal](https://github.com/microsoft/terminal/releases) - This will give you definitive terminal on windows
* [Visual Studio Code](https://code.visualstudio.com/Download) - Best IDE these days
* [IntelliJ Community](https://www.jetbrains.com/idea/download/#section=windows) - Best Java IDE these days
* [Git for windows](https://git-scm.com/download/win) - Latest git
* [Oracle JDK 8](https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html) and [Oracle JDK 8](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html) - You can download both and install and switch using your paths or java config tool
* [Apache Maven](https://maven.apache.org/download.cgi) - Needed to compile maven projects
* [Sublime Text](https://download.sublimetext.com/Sublime%20Text%20Build%203211%20x64%20Setup.exe) - Will allow you to edit files quickly
* [Python](https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe) - Run python scripts
* [Node JS](https://nodejs.org/dist/v18.2.0/node-v18.2.0-x64.msi) - Run node js app
* [GPG](https://www.gpg4win.org/download.html) - `winget install -e --id GnuPG.Gpg4win` - Needed for signing commits
* [Docker Desktop](https://www.docker.com/products/docker-desktop) - Needed for running containers

If you cannot use Docker Desktop, you can just [setup Docker in WSL](https://aem.design/blog/2022/02/01/goodbye-docker-desktop) and run it using your impressive [Windows Terminal](https://github.com/microsoft/terminal/releases)!

One-liner for all mentioned tools:

```bash
winget install -e --id Microsoft.PowerShell
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id JetBrains.IntelliJIDEA.Community
winget install -e --id Microsoft.Git
winget install -e --id Oracle.JavaRuntimeEnvironment
winget install -e --id ojdkbuild.openjdk.11.jdk
winget install -e --id Oracle.JDK.17
winget install -e --id SublimeHQ.SublimeText.4
winget install -e --id Python.Python.3.10
winget install -e --id CoreyButler.NVMforWindow
winget install -e --id GnuPG.Gpg4win
winget install -e --id Docker.DockerDesktop
curl https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip -o apache-maven-3.9.9-bin.zip
unzip apache-maven-3.9.9-bin.zip -d c:\apps\apache\
```

Once you have these tools set up, you should be able to contribute to most code projects.

Before you run off and get busy with code, you need to verify and do some windows config updates, these are not so obvious, but you will encounter these at some point.

## Enable Long File Path Names in Windows

Then you going to have to enable Windows Long file names.

1. Open up Windows Terminal as Administrator.
2. Run the following command:

```
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 0x1 /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Policies" /v LongPathsEnabled /t REG_DWORD /d 0x1 /f
```

4. Test if settings have been applied

```
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem"
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Policies"
```

## Enable Long File Path Names in Git

Now you are going to have to tell Git to use long file names, just in case it won't do it by default.

1. Open up Windows Terminal as Administrator.
2. Run the following command:
`git config --system core.longpaths true`

Now you can happily clone Linux/Unix repos that have very long paths!

### Setup Environment Varibles

To get the best out of your shell, you need to set up some environment variables that will give you access to 

1. Run `sysdm.cpl` as Administrator and on the Advanced tab, click `Environment Variables`.
2. Add new Variable `JAVA_HOME` point to `C:\Program Files\Java\jdk1.8.0_301`.
3. Add new Variable `M2_HOME` point to `C:\apps\apache\apache-maven-3.9.9` (where you installed maven) 
4. Under the `System Variables` select `Path` then click `Edit`
5. Under the `System Variables` click `New` and add the following:
  * **Variable name:** JAVA_HOME
  * **Variable value:** C:\Program Files\Java\jdk1.8.0_301
6. Add the following new paths:
  * `%JAVA_HOME%\bin` this will allow you to run java
  * `%M2_HOME%\bin` this will allow you to run maven
  * `C:\Program Files\Git\usr\bin` this will allow you to run various Linux commands, `sed`, `awk`, `grep` etc
7. Click `Ok` to all the remaining dialogue boxes to save all the changes
8. Verify java is installed by opening Windows Terminal and running `java -version` - you should see a Java JDK version if all went well

After this, you should have the following paths in your command line path:

```
%M2_HOME%\bin
%JAVA_HOME%\bin
C:\Program Files\Git\usr\bin
```

### Fix your git config

Commit like a pro with the following git config:

```bash
git config --global core.autocrlf false
git config --global core.eol lf
git config --global core.longpaths true
```

Setup your user and email:

```bash
git config --global user.name "{your account name}"
git config --global user.email {email}
```

### Setup GPG

Setup GPG signing:

```bash
git config --global user.signingkey {your public gpg key}
git config --global commit.gpgsign true
```

Extend you ttl for GPG cache and disable tty for GPG:

```bash
echo 'no-tty' >> ~/.gnupg/gpg.conf
echo 'default-cache-ttl 34560000' >> ~/.gnupg/gpg-agent.conf
echo 'maximum-cache-ttl 34560000' >> ~/.gnupg/gpg-agent.conf
```

Test your GPG setup:

```bash
gpg --list-secret-keys --keyid-format LONG
echo "test" | gpg --clearsig
```

If you are on linux, start the gpg-agent:

```bash
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
```

### Configure Docker

Create `.wslconfig` in `~/` with the following content.

```conf
[wsl2]
memory=6GB
```

This will ensure that WSL will not use up all of your resources. See more on [Advanced settings configuration in WSL](https://docs.microsoft.com/en-us/windows/wsl/wsl-config).

Once you reboot, your WSL should behave, and you will be able to use it with nice tools! Let me know what else you think should be on the list!

### Thank you

I hope you enjoyed this guide. If you have any questions or comments, feel free to contact me. I will be happy to help.

Let me know what you think and don't forget to tell your friends.
