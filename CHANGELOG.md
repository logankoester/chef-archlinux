CHANGELOG
=========

### 0.9.3

- Fixes pod2man command not found error in pacaur recipe
- Adds rubocop, guard, Rakefile and test-kitchen for serverspec (with Docker driver)
- Adds source_url and issues_url to metadata
- Prefer ruby 2.2.x over 2.3 due to deprecations upstream
- Fixes chefspec runner deprecation warning
- Locks Chef version for [sethvargo/chefspec#707](https://github.com/sethvargo/chefspec/issues/707)

### 0.9.2

- Moves dnsutils default package to bind-tools
- Refresh pacman database after writing pacman.conf template

### v0.9.1

- `ruby-shadow` recipe now uses chef_gem rather than AUR to install.

### v0.9.0

- Adds `ruby_shadow` recipe to install ruby-shadow from AUR. This is an optional dependency of the [user resource](https://docs.chef.io/resource_user.html).

### v0.8.0

- Pacaur recipe now uses skippgpcheck instead of importing key, because
  the build user 'nobody' has no home directory.

### v0.7.0

- Adds haveged recipe, adds keyring recipe, imports key for cower

### v0.6.1

- Switch pacman cookbook dependency for a fork that will not attempt to build --asroot

### v0.6.0

- Removes fix_chef_uid recipe (outdated)

### v0.5.0

- Adds journald.conf template and associated recipe

### v0.4.1

- Locales updates

### v0.4.0

- Big clean up. Update carefully!

### v0.3.1
- Fixes a simple mistake in the fix_chef_uid recipe pasted from the Chef blog

### v0.3.1
- Adds fix_chef_uid recipe.

### v0.3.0
- Adds static_network recipe

### v0.2.1
- Adds libxslt to utilities

### v0.2.0
- Adds hostname recipe

### v0.1.0
- Initial release
