#!/usr/bin/expect -f
set timeout 20
set password "xiaozhang"
spawn su - root
expect  "*密码*"
send "$password\n"

interact


