# Tagging

[![Gem Version](https://badge.fury.io/rb/tagging.svg)](https://badge.fury.io/rb/tagging)
[![Code Climate](https://codeclimate.com/github/altherlex/tagging/badges/gpa.svg)](https://codeclimate.com/github/altherlex/tagging)
[![Test Coverage](https://codeclimate.com/github/altherlex/tagging/badges/coverage.svg)](https://codeclimate.com/github/altherlex/tagging/coverage)

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

## Usage

* Rake

`bundle exec rake tagging:push`

### Bash

`cd /rails/app/path && git-tagging push`


* It's necessary that your server have ssh permission. Seting a git user

`git-tagging push --config user.email my@mail.com user.name "My Name"`


* Load remote tags

`git-tagging --version -f`


### AWS OpsWorkers (gem dpl) + CircleCI

```
dependencies:
  pre:
    - gem install tagging -v 0.2.1
    
deployment:
  production:
    branch: master
    commands:
      - git-tagging push --config user.email para.alves@gmail.com user.name "Altherlex Alves"
      - dpl --provider=opsworks --access-key-id=$AWS_ACCESS_KEY_ID --secret-access-key="$AWS_SECRET_ACCESS_KEY" --app-id=$AWS_ESPN_API_ID --wait-until-deployed --custom_json="{'deploy':{'espn_api':{'scm':{'revision':'tags/$(git-tagging --version)' }}}}" --skip_cleanup
```
