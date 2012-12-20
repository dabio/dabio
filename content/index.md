---
title: Writings and Projects of Danilo Braband
---

These are the writings and projects of Danilo Braband. You can contact me at <a class="email">dbraband [at] gmail . com</a>.

<% sorted_projects.each do |p| %>
<% if p[:url] %>
<h3><a href="<%= p[:url] %>" title="<%= p[:title] %>"><%= p[:title] %></a></h3>
<% else %>
<h2><%= p[:title] %></h2>
<% end %>
<%= p.compiled_content %>
<% end %>

