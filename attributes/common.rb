# Listen on 0.0.0.0:22
default['sshd']['keys']['Port'] = '22'
default['sshd']['keys']['ListenAddress'] = '0.0.0.0'

# HostKeys for protocol version 2
default['sshd']['keys']['HostKey'] = [
  '/etc/ssh/ssh_host_rsa_key',
  '/etc/ssh/ssh_host_dsa_key',
  '/etc/ssh/ssh_host_ecdsa_key',
  '/etc/ssh/ssh_host_ed25519_key'
]

# Lifetime and size of ephemeral keys
default['sshd']['keys']['KeyRegenerationInterval'] = '1800'
default['sshd']['keys']['ServerKeyBits'] = '1024'

# Set which types of authentication are allowed
default['sshd']['keys']['PasswordAuthentication'] = 'yes'
default['sshd']['keys']['PubkeyAuthentication'] = 'yes'
default['sshd']['keys']['RSAAuthentication'] = 'yes'
default['sshd']['keys']['GSSAPIAuthentication'] = 'no'

# Allow 60 seconds for a user to authenticate
default['sshd']['keys']['LoginGraceTime'] = "60"

# DOS protection: Allow 20 unauthenticated connections.
# Start dropping connections after 20 with 30% probability
# Increase drop probability linearly towards 100% when we have 100 connections
default['sshd']['keys']['MaxStartups'] = '20:30:100'

# Make sure user keyfiles have correct permissions (0600)
default['sshd']['keys']['StrictModes'] = 'yes'
default['sshd']['keys']['AuthorizedKeysFile'] =	'%h/.ssh/authorized_keys'

# Turn off SSH port forwarding
default['sshd']['keys']['AllowTcpForwarding'] = 'no'
default['sshd']['keys']['GatewayPorts'] = 'no'
