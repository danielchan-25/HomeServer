#!/bin/sh

# Install ssh services
sudo apt install openssh-server
## server
sudo service sshd restart
## client
sudo service ssh restart

# modify ssh port
echo 'Port 8022'>> /etc/ssh/sshd_config

# login timeout
echo 'export TMOUT=600' >> /etc/profile  # 10min
source /etc/profile
echo $TMOUT

# When the password error reaches five times, freeze for 30 seconds
echo 'auth required pam_tally2.so deny=5 unlock_time=30 even_deny_root root_unlock_time=30' >> /etc/pam.d/sshd

# Install rsyslog
sudo apt install rsyslog -y
systemctl start rsyslog && systemctl enable rsyslog

# note off:/etc/ssh/sshd_config
SyslogFacility AUTHPRIV
/etc/rsyslog.conf
authpriv.*    /var/log/secure

# start-up
service sshd retstart && service rsyslog restart
# check
less -N /var/log/secure
