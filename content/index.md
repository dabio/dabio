<% sorted_articles.each do |post| %>
## [<%= post[:title] %>](<%= post.path %>)
<% end %>
