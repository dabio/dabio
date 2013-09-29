---
layout: default
title: Projects
---

# Projects

You can check out all my my projects on [my GitHub profile](https://github.com/dabio).

{% for talk in site.categories.projects %}
- [{{ talk.title }}]({{ talk.url }})
  <time datetime="{{ talk.date | date_to_xmlschema }}">{{ talk.date | date: "%B %Y"  }}</time>
{% endfor %}
