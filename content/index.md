<% sorted_articles.select { |i| i.identifier =~ /^\/posts\// }.each do |post| %>
## [<%= post[:title] %>](<%= post.path %>)
<%= post.compiled_content(snapshot: :pre).partition(/\n\n/).first %>
<% end %>

---

## Snippets

Snippets are collections of code and terminal commands that I use on a regular basis. I put them here to not forget them.

<% sorted_articles.select { |i| i.identifier =~ /^\/snippets\// }.each do |post| %>
* [<%= post[:title] %>](<%= post.path %>)<% end %>
