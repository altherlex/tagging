# Tagging

Automated version management for your Gem builds.

## Resources

Install

```bash
$ sudo gem install gem_version

or

$ require 'gem_version'
```
	
## Description

Never bother updating the version for your next gem build by hand.  Configured in your Rakefile, gem_version automatically provides the next version and commits it to the repository.

## Use

* Rake

`bundle exec rake tagging:push`

* Bash

`cd /rails/app/path && tagging push`


## Adding other files

To add other files to the GemVersion.commit_and_push method use the block.  For instance,
if you want to commit and push the gemspec file also:

  task :gemspec do
    File.open("#{spec.name}.gemspec", 'w') do |f|
      f.write spec.to_ruby
    end
    GemVersion.increment_version
    GemVersion.commit_and_push do |git|
      git.add("#{spec.name}.gemspec")
    end
  end

## Bumping or resetting the next gem version

GemVersion creates a file named 'next_gem_version' in the root directory of your project which contains the 'next' gem version.  Edit the version in this file or use the rake tasks to bump or set the version for the next build.

GemVersion increments the last component of your version.  If you need to bump from 0.1.x to 0.2.x, you'll need to bump the version manually.

## Rake tasks

Two rake tasks gem:clean and gem:version are available whenever you require gem_version.

* Clean the project root of .gem and .gemspec files.

  rake gem:clean

* Get the next gem version

  rake gem:version

* Set the next gem version

  rake gem:version set=0.1.0


## Dependencies

* Git gem (>= 1.2.5)
