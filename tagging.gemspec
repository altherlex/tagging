# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require "tagging/version"

Gem::Specification.new do |s|
  s.name                  = "tagging"
  s.platform              = Gem::Platform::RUBY
  s.authors               = ["Alther Alves"]
  s.email                 = ["para.alves@gmail.com"]
  s.date                  = "2016-04-21"
  s.homepage              = "http://github.com/altherlex/gem_version/tree/master"
  s.summary               = %q{Never bother updating the version for your next gem build by hand.  Configured in your Rakefile, gem_version provides the next Gem version and stores it to the repository.}
  s.description           = %q{Automated version management for your Gem and RailsApp builds}
  
  s.files                 = `git ls-files`.split("\n")
  s.test_files            = `git ls-files -- spec/*`.split("\n")
  s.executables           = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths         = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.6")
  s.rubygems_version      = %q{1.3.7}
  s.version               = Tagging::VERSION
  s.license               = "MIT"

  s.add_dependency 'git', [">= 1.2.5"]
  s.add_dependency 'logger'

  # s.add_runtime_dependency 'git', '~> 1.2', '>= 1.2.5'
  # s.add_runtime_dependency 'logger', '~> 0'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
  # s.add_development_dependency 'coveralls'
end
