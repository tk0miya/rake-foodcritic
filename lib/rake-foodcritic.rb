require "rake-foodcritic/version"
require "foodcritic"

namespace :chef do
  desc "Run foodcritic"
  task :foodcritic do
    if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
      print "Running foodcritic ... "
      if File.exists?('cookbooks')
        result = FoodCritic::Linter.new.check cookbook_paths: ['cookbooks']
      else
        result = FoodCritic::Linter.new.check cookbook_paths: '.'
      end

      if result.failed? or result.warnings.size > 0
        puts "FAILED"
        puts result
        fail
      else
        puts "OK"
      end
    else
      puts "WARNING: Skipped running foodcritic. Ruby 1.9.2 or higher required"
    end
  end
end
