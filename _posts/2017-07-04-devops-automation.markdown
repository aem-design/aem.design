---
layout: single
permalink: /blog/2017/07/04/devops-automation
title:  "DevOps Automaton"
date:   2017-07-04 21:25:00 +1100
author: max@aem.design
categories:
  - blog
tags:
  - devops
  - update
---

Over last few weeks we have spent considerable time to get the DevOps bootstrap working more consistently across Mac, Linux and Windows.

![DevOps Bootstrap](/assets/images/devops/bootstrap.png)

Out of all of the operating systems Windows was the hardest and easiest to get working! Yes, it can be like that!

In the hindsight Windows it’s the easiest as you do not have a lot of choice for proper bash that can interact with Windows Processes directly, so and Cygwin handles this very well. In addition to this some corporates have Dual Account setup for all developers that requires developers to login as Local Admin account to install software. This is was challenging to play with and we would recommend to avoid as much as possible but in the end it work.

![DevOps Bootstrap Success Win10 Cygwin](/assets/images/devops/success-win10-cygwin1.png)

Mac on the other hand poses sever other challenges it comes bundles with Python so a use of private virtual environments for isolating from system installation was implemented and used across all OS's.

![DevOps Bootstrap Success Mac](/assets/images/devops/success-mac.png)

Linux Ubuntu on the other hand was the simplest to setup and use, even if you have Secure Boot enabled only VirtualBox installation had extra steps to install signed driver.

![DevOps Bootstrap Success Mac](/assets/images/devops/success-ubuntu.png)

Also during this update autocomplete was added to DevOps bootstrap!

[![asciicast](https://asciinema.org/a/3GrVPCGnClzzQQW9MWWqpZ9Vt.png)](https://asciinema.org/a/3GrVPCGnClzzQQW9MWWqpZ9Vt)

As always let us know what you think.
