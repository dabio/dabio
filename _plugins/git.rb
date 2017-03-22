# frozen_string_literal: true
module Jekyll
  # GitGenerator will give you basic information about the current git
  # status. Currently only the number of `commits` and the current commit
  # `hash` is implemented.
  class GitGenerator < Generator
    priority :high
    safe true

    def generate(site)
      site.data['hash'] = `git rev-parse --short HEAD`.strip
      site.data['commits'] = `git rev-list HEAD --count`.strip
    end
  end
end
