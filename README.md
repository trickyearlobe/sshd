# sshd

This cookbook lays down a sensible default configuration for SSHD.

## Installation

```
# Grab it from the github repo
git clone https://github.com/trickyearlobe/sshd.git

# Make sure berks knows the right local version
berks install

# Upload to Chef Server and freeze the version to prevent accidents :)
berks upload
```

## Modifying the default behaviour

The recommended way is to create a wrapper cookbook to add or override
the default attributes.

First make the wrapper

```chef generate cookbook my_sshd```

Then create or override the attributes
```
# -----------------------------
# my_sshd/attributes/default.rb
# -----------------------------

# Some weird parameter
default['sshd']['keys']['MyNewParameter'] = 'The best thing since sliced bread'

# Permit root logins over the network
normal['sshd']['keys']['PermitRootLogin'] = true
```

Add a dependency in metadata.rb ```depends "sshd"```

Include recipe in your default.rb ```include_recipe "sshd::default"```

# Contributing

* Fork the repo on Github
* Make some tests
* Make changes on a branch until your tests pass
* Submit a pull request

**Note:**

* Large changes may be rejected... keep it small and focussed.
* Changes without tests may be rejected.
