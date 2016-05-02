require 'git'
require 'logger'

module Tagging
  class AppVersion

    def initialize(options={})
      @options = {message:'versioning by CI'}.merge(options)
      @git = nil
    end

    def version
      load_tags if @options[:load_tags]
      @options[:current_version] ||= `git -C #{Dir.pwd} describe --tags $(git -C #{Dir.pwd} for-each-ref refs/tags --sort=-taggerdate --format='%(objectname)' --count=1)`.chomp
      @options[:current_version] = self.class.init_version_file unless self.class.version_format_valid?(@options[:current_version])
      @options[:current_version]
    end

    def load_tags
      puts "git -C #{Dir.pwd} fetch --tags" 
      `git -C #{Dir.pwd} fetch --tags`
    end

    def self.version_format_valid?(v='')
      (v && v =~ /^v\d+\.\d+\.\d+-[\.\d+]+$/)
    end

    def self.init_version_file
      initial_version = 'v0.0.1-00'
    end

    def increment_and_push
      load_tags
      increment_version
      commit_and_push
    end

    def increment_version
      @options[:current_version] = self.version.next
    end

    def set_global_config
      if @options[:config]
        @options[:config].each do |key, value|
          @git.config(key, value)
        end
      end
    end

    def commit_and_push(project_directory=Dir.pwd)
      @git = Git.open(project_directory, :log=>Logger.new(STDOUT))
      
      set_global_config

      @git.add_tag(self.version, nil, message: @options[:message])
      @git.push('origin', "refs/tags/#{self.version}")
    end
  end
end