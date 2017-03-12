##############################################
## These settings are applied to Solaris 10 ##
##                                          ##
## Retrictions are from CIS level 1         ##
## https://benchmarks.cisecurity.org        ##
##############################################

if node['os'] == 'solaris2'

  default['sshd']['keys']['KeepAlive'] = 'yes'
  default['sshd']['keys']['PAMAuthenticationViaKBDInt'] = 'yes'

  # Linux calls this option UseDNS
  # Prevent DNS lookups slowing down logon and killing the DNS
  default['sshd']['keys']['LookupClientHostnames'] = 'no'

  # sftp subsystem
  default['sshd']['keys']['Subsystem'] = 'sftp internal-sftp'

end
