# frozen_string_literal: true

# Overide by OS
keyfile = 'keyfile '
driftfile = '/var/lib/chrony/'
logdir = 'logdir /var/log/chrony'
case platform[:name]
when 'debian', 'ubuntu'
  config_file = '/etc/chrony/chrony.conf'
  keyfile += '/etc/chrony/chrony.keys'
  driftfile += 'chrony.drift'
when 'gentoo'
  config_file = '/etc/chrony/chrony.conf'
  keyfile += '/etc/chrony.keys'
  driftfile += 'drift'
else
  config_file = '/etc/chrony.conf'
  keyfile += '/etc/chrony.keys'
  driftfile += 'drift'
end

control 'Chrony configuration' do
  title 'should match desired lines'

  describe file(config_file) do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should include keyfile }
    its('content') { should include driftfile }
    its('content') { should include logdir }
    its('content') { should include 'server 0.debian.pool.ntp.org iburst' }
    its('content') { should include 'server 1.centos.pool.ntp.org' }
    its('content') { should include 'pool 0.debian.pool.ntp.org iburst' }
    its('content') { should include 'pool 1.centos.pool.ntp.org' }
  end
end
