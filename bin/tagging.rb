#!/usr/bin/env ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'tagging/app_version'
require 'tagging/gem_version'

module Tagging
  class CLI
    def self.run(*args)
      puts '*'*40
      puts args.inspect
      puts '*'*40
      
      case args
      when :push
        puts Tagging::AppVersion.increment_and_push rescue exit 1
        exit 0

      when :version
        puts Tagging::AppVersion.version rescue exit 1
        exit 0

      when :next_version
        puts Tagging::AppVersion.increment_version rescue exit 1
        exit 0
    end
  end
end

Tagging::CLI.run(ARGV)