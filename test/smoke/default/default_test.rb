# # encoding: utf-8

# Inspec test for recipe sshd::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

case os[:family]
  when /redhat|debian/
    service_name = 'sshd'
  when /solaris/
    service_name = 'ssh'
  else
    service_name = "ssh on unsupported OS #{os[:family]}"
end



describe file('/etc/ssh/sshd_config') do
  its('content') { should match /^PermitRootLogin no$/ }
end

describe service(service_name) do
  it { should be_enabled }
  it { should be_running }
end

describe bash('/usr/bin/ssh -1 -o StrictHostKeyChecking=no localhost') do
  its('stderr') {should match "Protocol major versions differ: 1 vs. 2" }
end
