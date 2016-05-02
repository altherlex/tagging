# Tagging

[![Gem Version](https://badge.fury.io/rb/tagging.svg)](https://badge.fury.io/rb/tagging)

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

### Bash

`cd /rails/app/path && git-tagging push`


* It's necessary that your server have ssh permission. Seting a git user

`git-tagging push --config user.email you@example.com`


* Load remote tags

`git-tagging --version -f`


### AWS OpsWorkers + CircleCI

```
  production:
    branch: master
    commands:
      - git-tagging --push
      - dpl --provider=opsworks --access-key-id=$AWS_ACCESS_KEY_ID --secret-access-key="$AWS_SECRET_ACCESS_KEY" --app-id=$AWS_APP_ID --wait-until-deployed --custom_json='{"deploy":{"my_app":{"scm":{"revision":"tags/$(git-tagging --version)" }}}}' --skip_cleanup
```


## Dependencies

* Git gem (>= 1.2.5)