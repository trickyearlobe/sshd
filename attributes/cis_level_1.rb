#############################################
## These settings are applied to all OS'es ##
##                                         ##
## Retrictions are from CIS level 1        ##
## https://benchmarks.cisecurity.org       ##
#############################################


# CIS level 1 recommends only allowing SSHv2
default['sshd']['keys']['Protocol'] = '2'

# CIS level 1 recommends logging at INFO level
default['sshd']['keys']['LogLevel'] = 'INFO'
default['sshd']['keys']['SyslogFacility'] = 'AUTH'

# CIS level 1 recommends disabling X11 forwarding unless its used operationally
default['sshd']['keys']['X11Forwarding'] = 'no'
default['sshd']['keys']['X11DisplayOffset'] = '10'
default['sshd']['keys']['X11UseLocalhost'] = 'yes'

# CIS level 1 recommends permitting 4 attempts to authenticate
default['sshd']['keys']['MaxAuthTries'] = '4'

# CIS level 1 recommends disabling host based Authentication
default['sshd']['keys']['IgnoreRhosts'] = 'yes'
default['sshd']['keys']['HostbasedAuthentication'] = 'no'
default['sshd']['keys']['RhostsRSAAuthentication'] = 'no'

# CIS level 1 recommends disabling remote root login
default['sshd']['keys']['PermitRootLogin'] = 'no'

# CIS level 1 recommends disabling empty passwords
default['sshd']['keys']['PermitEmptyPasswords'] = 'no'

# CIS level 1 recommends disabling passing user environment variables
default['sshd']['keys']['PermitUserEnvironment'] = 'no'

# CIS level 1 recommends use of only newer AES counter mode Ciphers
# See http://www.ietf.org/rfc/rfc4344.txt.
default['sshd']['keys']['Ciphers'] = 'aes128-ctr,aes192-ctr,aes256-ctr'

# CIS level 1 recommends setting an idle session timeout (5 minutes is suggested)
default['sshd']['keys']['ClientAliveInterval'] = '300'
default['sshd']['keys']['ClientAliveCountMax'] = '0'

# CIS level 1 recommends using AllowUser/AllowGroups/DenyUsers/DenyGroups to
# restrict who can log on via SSH. Since we don't have a good list we will leave
# this unset for now. Please make a policy for this.

# CIS level 1 recommends minimal messages at login that give away system info
# but we do want to tell legitimate users when their accounts were last used.
default['sshd']['keys']['PrintMotd'] = 'no'
default['sshd']['keys']['PrintLastLog'] = 'yes'


# CIS level 1 recommends setting a logon banner which aids criminal prosecutions
# but which doesn't give away machine or company information.
default['sshd']['keys']['Banner'] = '/etc/issue'
default['sshd']['legal_banner'] = "

                                WARNING

You are not permitted to access this system for any purpose unless explicitly
authorized by an authorized company representative. Any authorized access must
be conducted according to the company 'Acceptable Use Policy'

Users of this system have no right of privacy. Activities on this system may
be monitored and/or recorded. Recordings of activity may be provided to law
enforcement and/or other investigative agencies.

Unauthorized or illegal activities may be punishable by law. Violations of
the company 'Acceptable Use Policy' may be subject to disciplinary action
including denial of access, legal prosecution and/or dismissal.

By attempting to access this system you indicate your acceptance of these
terms. If you are not authorized to access the system or you do not agree to
these terms, disconnect now.

"
