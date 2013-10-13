---
layout: default
title: Posts
---

# Posts

{% for post in site.categories.posts %}

## [{{ post.title }} »]({{ post.url }})

{{ post.excerpt }}
  
{% endfor %}
