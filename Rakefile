###############
# Development #
###############

desc "Same as rake watch"
task :default => :watch

desc "Watch the site and regenerate when it changes"
task :watch => [:clean] do
  puts "Starting to watch source with Jekyll and Compass."
  pids = [
    spawn('bundle exec jekyll serve --watch'),
    spawn('bundle exec sass --style compressed --scss --watch _assets:css')
  ]

  trap 'INT' do
    Process.kill 'INT', *pids
    exit 1
  end

  loop do
    sleep 1
  end
end

##############
# Deployment #
##############

desc "Deploy to github"
task :deploy do
  `git push origin gh-pages`
  `curl www.google.com/webmasters/tools/ping?sitemap=http%3A%2F%2Fdab.io%2Ffeeds%2Fsitemap.xml`
end

###############
# Un-/Install #
###############

desc 'Clean out caches: .sass-cache and _site'
task :clean do
  rm_rf ['.sass-cache/', '_site/']
end

desc 'Installs all dependencies for running locally'
task :install do
  `bundle install --binstubs --path vendor/gems --without production`
  rm_rf ['vendor/gems/ruby/1.9.1/gems/jekyll-*/test/source/']
end

desc 'Uninstalls all rubygems and temp files'
task :uninstall => [:clean] do
  rm_rf ['Gemfile.lock', 'vendor/', 'bin/', '.bundle/']
end

#############
# New Posts #
#############

posts_dir = '_posts'

desc "Begin a new post in #{posts_dir}"
task :new_post, :title do |t, args|
  require 'rubygems'
  require 'bundler/setup'
  require 'stringex'

  if args.title
    title = args.title
  else
    title = get_stdin 'Enter a title for your post: '
  end
  filename = "#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"

  if File.exists?(filename)
    abort 'Rake aborted! File exists.'
  end

  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts '---'
    post.puts 'layout: post'
    post.puts "title: \"#{title.gsub(/&/, '&amp;')}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "category: "
    post.puts '---'
  end
end

###########
# Helpers #
###########

def get_stdin(message)
  print message
  STDIN.gets.chomp
end
