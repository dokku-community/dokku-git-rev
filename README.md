# `git rev-parse HEAD` in dokku env

Lets you fetch the git revision hash used to build the app from the `GIT_REV`
environment variable.

## Installation

```
cd /var/lib/dokku/plugins
git clone https://github.com/cjblomqvist/dokku-git-rev
```

The environment variable will be set next time you deploy.

## Kudos to...
* nornagon who made the initial plugin (albeit it was not really working) - this plugin is built upon his work (https://github.com/nornagon/dokku-git-rev)
* mlebkowski/`puck who helped me out and made the initial verison of the receive-app based version. I based this version upon that idea and made it bug free and more stable (https://github.com/mlebkowski/dokku-git-rev/tree/fix/first-push)
