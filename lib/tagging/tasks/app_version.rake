
namespace :tagging do
  desc "Setting next gem version and push the tag version"
  task :push do
    puts Tagging::AppVersion.increment_and_push rescue exit 1
    exit 0
  end

  desc "Setting next gem version and push the tag version"
  task :version do
    puts Tagging::AppVersion.version rescue exit 1
    exit 0
  end

  desc "Setting next gem version and push the tag version"
  task :next_version do
    puts Tagging::AppVersion.increment_version rescue exit 1
    exit 0
  end
end
