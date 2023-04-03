---
author: rs
title: Chirpy Build Issue
date: 2023-04-01 13:01:00 -0500 
categories: [Jekykll, Chirpy]
tags: [jekyll,chirpy,issues]
---

When trying to build locally or on github with more than 10 posts, I came across the following issue:  
```
  Liquid Exception: no implicit conversion of nil into String in /home/dbqrs/gems/gems/jekyll-theme-chirpy-5.6.1/_layouts/default.html
/home/dbqrs/gems/gems/jekyll-seo-tag-2.8.0/lib/jekyll-seo-tag/drop.rb:70:in `+': no implicit conversion of nil into String (TypeError)

        return page_number + @title if page_number
```        

The problem was in _config.yml on line 22  
```
title: #dbqrs.com 
```

I do not recall why, but I commented out dbqrs.com and a problem did not arise until I tried building with more than 10 posts.

Uncommenting resolved the issue. 
```
title: dbqrs.com
```

