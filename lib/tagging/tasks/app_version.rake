
namespace :tagging do
  desc "Setting next gem version and push the tag version"
  task :push do
    puts Tagging::AppVersion.increment_and_push
  end

  desc "Setting next gem version and push the tag version"
  task :version do
    puts Tagging::AppVersion.next_version
  end

  desc "Setting next gem version and push the tag version"
  task :version do
    puts Tagging::AppVersion.version
  end

  desc "Setting next gem version and push the tag version"
  task :next_version do
    puts Tagging::AppVersion.increment_version
  end
end
