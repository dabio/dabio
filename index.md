---
layout: page
---

Hi, I'm Danilo Braband. I'm a developer at [parku](http://parku.ch).

I spend the past two years working with an ecommerce agency to improve their online
shops. Outside my day job I've explored and learned a few programming languages and continue to practice those. I generally work with Go, Ruby, Objective-C, Git and Mac.

On a more personal note, I love cycling (I usually ride with the [Berlin Racing Team](http://www.berlinracingteam.de), and swimming. If you'd like to discuss something or need any advice, please shoot me an email. I'm pretty friendly.

{% comment %}

{% for w in site.categories.writings %}

  <h2><a href="{{ w.url }}">{{ w.title }}</a></h2>

  {{ w.content }}

{% endfor %}

{% if site.categories.talks %}
  <h2>Talks</h2>
  <dl class=talks>
  {% for talk in site.categories.talks %}
    <dt><a href="{{ talk.url }}">{{ talk.title }}</a></dt>
  {% endfor %}
  </dl>
{% endif %}

{% if site.categories.projects %}
  <h2>Projects</h2>
  <dl class=projects>
  {% for project in site.categories.projects %}
    <dt><a href="{{ project.project-url }}">{{ project.title }}</a></dt>
    <dd>{{ project.content }}</dd>
  {% endfor %}
  </dl>
{% endif %}

{% endcomment %}
