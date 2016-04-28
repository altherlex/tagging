namespace :tagging do
  namespace :gem do
    desc "Clean *.gem* files from project root"
    task :clean do
      FileUtils.rm_f Dir.glob('*.gem*')
      exit 0
    end

    desc "Return and set next gem version"
    task :version do
      if (ENV.include?("set"))
        version = ENV['set'].gsub(/'/, '')
        unless Tagging::GemVersion.version_format_valid?(version)
          raise "Version '#{version}' format invalid.  Must only contain digits separated by decimal points."
        end
        Tagging::GemVersion.set_version(version)
        puts "Next version set at '#{version}'"
      else
        puts Tagging::GemVersion.next_version
      end
      exit 0
    end
  end
end
