shellcheck:
ifeq ($(shell shellcheck > /dev/null 2>&1 ; echo $$?),127)
ifeq ($(shell uname),Darwin)
	brew install shellcheck
else
	sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse'
	sudo apt-get update -qq && sudo apt-get install -qq -y shellcheck
endif
endif

bats:
ifeq ($(shell bats > /dev/null 2>&1 ; echo $$?),127)
ifeq ($(shell uname),Darwin)
	brew install shellcheck
else
	sudo add-apt-repository ppa:duggan/bats --yes
	sudo apt-get update -qq && sudo apt-get install -qq -y bats
endif
endif

ci-dependencies: shellcheck bats

lint:
	# these are disabled
	# SC1090: Can't follow non-constant source. Use a directive to specify location.
	@echo linting...
	@$(QUIET) find ./ -maxdepth 1 -not -path '*/\.*' | xargs file | egrep "source|bash" | awk '{ print $$1 }' | sed 's/://g' | xargs shellcheck -e SC1090

setup:
	$(MAKE) ci-dependencies

test: setup lint
