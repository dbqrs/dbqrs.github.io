---
author: rs
title: Resolve google-protobuf Error
date: 2024-01-15 02:00:00 -0500 
categories: [github, ruby]
tags: [github,google-protobuf,ruby,jeckyl]
---

I recently ran into an issue where github would fail building and deploying dbqrs.com.  
 
I got the following errror messages:

```
An error occurred while installing google-protobuf (3.25.2), and Bundler cannot continue.  

'/opt/hostedtoolcache/Ruby/3.3.0/x64/bin/bundle' failed with exit code 5  
```

To reolve the issue I changed ruby-version: 3 to ruby-version: 3.2 in  
**.github/workflows/pages-deploy.yml**


