#!/usr/bin/expect -f
## 此脚本用于自动连接阿里云服务器

set user Johnny
set host 139.224.130.5
set password rll342399069
set timeout 60

spawn ssh $user@$host
expect "*assword:*"
send "$password\r"
interact
expect eof


## ssh Johnny@139.224.130.5
