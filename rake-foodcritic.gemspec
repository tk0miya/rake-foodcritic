# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake-foodcritic/version'

Gem::Specification.new do |gem|
  gem.name          = "rake-foodcritic"
  gem.version       = Rake::Foodcritic::VERSION
  gem.authors       = ["Takeshi KOMIYA"]
  gem.email         = ["i.tkomiya@gmail.com"]
  gem.description   = "Rake task for chef cookbooks"
  gem.summary       = "Rake task for chef cookbooks"
  gem.homepage      = "https://github.com/tk0miya/rake-foodcritic"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rake'
  gem.add_dependency 'foodcritic', '>= 3.0.0'
end
