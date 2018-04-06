<% sorted_articles.each do |post| %>
## [<%= post[:title] %>](<%= post.path %>)
<%= post.compiled_content(snapshot: :pre).partition(/\n\n/).first %>
<% end %>
