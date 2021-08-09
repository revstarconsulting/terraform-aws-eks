MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="//"

--//
Content-Type: text/x-shellscript; charset="us-ascii"

#!/bin/bash
echo fs.inotify.max_user_instances=512 | tee -a /etc/sysctl.conf
echo fs.inotify.max_user_watches=32768 | tee -a /etc/sysctl.conf
sysctl -p

--//--