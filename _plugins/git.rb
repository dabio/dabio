module Jekyll
  class GitGenerator < Generator
    priority :high
    safe true

    def generate(site)
      site.data['hash'] = %x( git rev-parse --short HEAD ).strip
      site.data['commits'] = %x( git rev-list HEAD --count ).strip
    end
  end
end
