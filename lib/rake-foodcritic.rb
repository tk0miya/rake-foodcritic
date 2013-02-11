require "rake-foodcritic/version"

namespace :chef do
  desc "Run foodcritic"
  task :foodcritic do
    if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
      path = File.join(%w{tmp foodcritic})
      foodcritic_sandbox(path) do
        sh "foodcritic --epic-fail any #{path}"
      end
    else
      puts "WARNING: Skipped running foodcritic. Ruby 1.9.2 or higher required"
    end
  end

  def foodcritic_sandbox(path)
    files = %w{*.md *.rb attributes definitions files
               libraries providers recipes resources templates}

    begin
      rm_rf path
      mkdir_p path
      cp_r Dir.glob("{#{files.join(',')}}"), path
      yield
    ensure
      rm_rf path
    end
  end
end
