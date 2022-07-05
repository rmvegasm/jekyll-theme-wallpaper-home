# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-wallpaper-home"
  spec.version       = "0.1.1"
  spec.authors       = ["rmvegasm"]
  spec.email         = ["rmvegasm@gmail.com"]

  spec.summary       = "A simple jekyll theme for a personal page."
  spec.homepage      = "https://github.com/rmvegasm/jekyll-theme-wallpaper-home"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", "~> 12.3"
end
