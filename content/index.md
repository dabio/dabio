---
title: Writings and Projects of Danilo Braband
---

<section class="row">
<section class="twothird centered">

These are the writings and projects of Danilo Braband. You can contact me at <a class="email">dbraband [at] gmail . com</a>.

</section>
</section>

<% if projects.length > 0 %>

<header class="row">
    <h2 class="twothird centered">Projects</h2>
</header>

<% sorted_projects.each do |p| %>
<%= p.compiled_content %>
<% end %>
<% end %>

