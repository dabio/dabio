---
layout: default
---

# Talks

{% for talk in site.categories.talks %}
- [{{ talk.title }}]({{ talk.url }})
  <time datetime="{{ talk.date | date_to_xmlschema }}">{{ talk.date | date: "%B %Y"  }}</time>
{% endfor %}
