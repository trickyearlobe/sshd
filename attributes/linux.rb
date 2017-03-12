if node['os'] == 'linux'

  # Solaris doesn't support this option
  # Disable KerberosAuthentication
  default['sshd']['keys']['KerberosAuthentication'] = 'no'

  # Solaris doesn't support this option
  # Use pluggable authentication modules
  default['sshd']['keys']['UsePAM'] = 'yes'


  # Solaris doesn't support this option
  #Privilege Separation is turned on for security
  default['sshd']['keys']['UsePrivilegeSeparation'] = 'yes'

  # Solaris doesn't support this option
  # Prevent the use of S/Key passwords
  default['sshd']['keys']['ChallengeResponseAuthentication'] = 'no'

  # Solaris doesn't support this option
  default['sshd']['keys']['TCPKeepAlive'] = 'yes'

  # Allow SFTP
  default['sshd']['keys']['Subsystem'] = 'sftp /usr/lib/openssh/sftp-server'

  # Solaris calls this LookupClientHostnames
  # Prevent DNS lookups slowing down logon and killing the DNS
  default['sshd']['keys']['UseDNS'] = 'no'

  # Solaris doesn't support this option
  # Allow client to pass LOCALE environment variables
  default['sshd']['keys']['AcceptEnv'] = []
  default['sshd']['keys']['AcceptEnv'] += ['LANG LC_*','XMODIFIERS']
  # Allow client to pass PROXY environment variables
  default['sshd']['keys']['AcceptEnv'] += ['http_proxy','https_proxy','no_proxy']
  # Allow client to pass a custom shell prompt.
  default['sshd']['keys']['AcceptEnv'] += ['PS1']
end
