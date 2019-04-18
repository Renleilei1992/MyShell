# MyShell
It's all about my Shell learning and config. A Linux Server Administrator should Know :) :)


### 运算符
    -eq     比较两个数是否相等
    -ne     比较两个数是否不等
    -lt     参数1是否小于参数2
    -le     参数1是否小于等于参数2
    -gt     参数1是否大于参数2 
    -ge     参数1是否大于等于参数2
    -f      检查某文件是否存在
    -d      检查目录是否存在

### 查询某目录下满足条件的文件：      
- find ./ -size +1000c –print  (查询当前目录下大于1000字节的文件名，并打印出来)
- find ./ -size +10 –print (查询当前目录下大于10块的文件名，blocks = 512 字节
- find ../ -name "test*" (-print) (能够查询到../(上级目录)中的所有适配test的文件，此处通配符适用) 
- find ./ -name 'bxdx_gafe.*.tar' -ctime +2 -type f -exec rm -rf {} \; //删除过期两天的文件，注意单引号

### 实用小技巧
- banner hello （可以打印出一个加大版的hello）
- wall xxxxxx （可以在服务器登录的用户界面显示xxxxx,相当于公告）
- diff filename_1 filename_2 (能够查找两个文件的区别所在)
- diff3 filename_1 filename_2 filename_3 (能够同时查找三个文件的区别所在)
- dircmp [-s] [-d] dir_1 dir_2 (能够查询两个文件夹中相同的文件及同名不同内容的文件)
- wc -l (在命令后使用管道符加之可以显示行数，或者直接使用 wc -l xxx.sh 或者cat xxx.sh | wc -l)
- who | grep username(userIP) 查看当前登录系统的用户并查看以该用户名或者IP登录的人
- vmstat -w （查看计算机的硬件状态）
- iostat （查看计算机的io状态，是否有io wait）
- topas （查看计算机的CPU状态以及正在进行的进程）
- topas 进入之后键盘输入 c/d/n 等，分别对应cpu/disk/net ,可以输入h查看帮助中的各参数
- expr int1 operator int 2 (使用expr命令驱动算数运算符，乘法*需要转义- 通配符转义)
- script /xx/xx/xx.log （使用Linux自带的监视终端屏幕显示，输入及输出）
- more log.txt | grep 'b' (查询并显示log.txt文件中包含b字符的行)
- more log.txt | grep '[Bb]' (查询并显示log.txt文件中包含 b或B 字符的行)
- sed 's/|//g' filename.txt (将filename.txt中的 | 字符替换为空后显示出来，实际文件未替换)
- sed 's/|//g' filename.txt > filename_new.txt （将|字符替换为空后写入到filename_new.txt中）
- if [ -d log ] (该语句可以查看当前目录下是否存在log目录，else为不存在)
- tail -n 10000 filename > ~/tmp/20170622.txt (可以将filename文件中最末尾的1w行写入txt文件中)

### 查看进程及杀死进程:
- ps -ef | grep ttU110 | wc -l (可以查看ttU110进程目前有多少个)
- ps -ef | grep ttU110 | grep -V grep | awk -F" " '{print $2}' | xargs kill -9 (循环杀死该名所有进程)
- 王轩老师的 sha.sh
```
ps -ef | grep $1 | grep -V grep >jincheng.txt
cat jincheng.txt | while read LINE
do
proc=`echo $LINE | awk '{print $2}'`
echo $proc
kill -9 $proc
done
```

### 压缩及打包方式
- tar -cvf ~/tmp/etc.tar ./etc/* （将当前目录下的etc文件夹下所有文件打包至tmp目录下的etc.tar）
- tar -xvf ./etc.tar （将当前目录下的etc.tar直接解开）
- tar zxvf ./etc.tar.gz -C /log （解压到指定路径）
- gzip xxx.tar （将xxx.tar压缩为 .gz 格式）
- gunzip xxx.tar.gz （将xxx.tar.gz压缩包解压）
- compress -f xxx.tar （将xxx.tar压缩为.Z格式）

### 服务器连接（ftp/sftp）
- 从服务器 A 连接至服务器 B - ftp 10.129.9.94 //(B's ip) - 输入账号:cbs - 输入密码:spdb1234
- bin（二进制模式传输文件）-  cd xxx/xx/xx //可以输入pwd或ls -lrt -  get xxx.xx 或者 put xxx.xx

### 修改root@颜色
- vim ~/.bashrc  然后加入下面一行
export PS1='\[\e[32m\][\[\e[35m\]\u\[\e[m\]@\[\e[36m\]\h \[\e[31m\]\W\[\e[32m\]]\[\e[36m\]\$\[\e[m\] '

### linux 添加用户、权限
- http://www.cnblogs.com/daizhuacai/archive/2013/01/17/2865132.html （新用户添加、）
- http://blog.chinaunix.net/uid-25436678-id-3853661.html （用户、组）
- http://blog.csdn.net/nyist327/article/details/45056591 （解决tab、退格上下键、环境变量）
1. useradd –d /usr/sam -m sam
此命令创建了一个用户sam，其中-d和-m选项用来为登录名sam产生一个主目录/usr/sam（/usr为默认的用户主目录所在的父目录）。
假设当前用户是sam，则下面的命令修改该用户自己的口令：
2. passwd
Old password:******
New password:*******
Re-enter new password:*******
如果是超级用户，可以用下列形式指定任何用户的口令：
3. passwd sam
New password:*******
Re-enter new password:*******
4. groupadd basic 添加basic组

- 改变所有者（chown）和用户组（chgrp）命令
```
chown xiaoming abc      //改变abc的所有者为xiaoming
chgrp root abc          //改变abc所属的组为root
chown root ./abc        //改变abc这个目录的所有者是root
chown ‐R root ./abc     //改变abc这个目录及其下面所有的文件和目录的所有者是root
```

### 环境变量问题
- http://www.cnblogs.com/mengyan/archive/2012/09/04/2669894.html
### 环境变量 export问题 /home/.bash_profile
- http://blog.csdn.net/wl_fln/article/details/7258294
- http://blog.csdn.net/lylwo317/article/details/51285404

### 查看系统版本、内核版本、位数
```
uname -a            //内核版本 
lsb_release -a      //系统版本 // cat /etc/issue 可以设置登录画面
getconf LONG_BIT    //显示64即为64位
/etc/motd           //可以添加开机对用户说的话
```

### sudoers权限问题
```
pkexec chmod 0440 /etc/sudoers
pkexec chmod 0440 /etc/sudoers.d
```
- 保证 /etc/hosts 中 127.0.0.1后面的 主机名和 /etc/hostname 中一致

### SSH免密码登录远程服务器（配置私钥和公钥）
1. 确认系统已经安装了SSH
```
rpm –qa | grep openssh
rpm –qa | grep rsync
service sshd restart //重启ssh服务
```
2. 生成秘钥对
```
ssh-keygen –t rsa –P '' -- 直接回车生成的密钥对：id_rsa和id_rsa.pub，默认存储在 ~/.ssh/`  注意：最后是两个单引号
```
3. 把id_rsa.pub追加到授权的key里
```
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```
4. 修改授权key的权限
```
chmod 600 ~/.ssh/authorized_keys
```
5. 修改SSH配置文件
```
    su -  //登陆root用户修改配置文件
vim /etc/ssh/sshd_config    //去掉下面的三行的注释（包含yes结尾关于ssh配置的三行）
RSAAuthentication yes
PubkeyAuthentication yes
AuthorizedKeyFile .ssh/authorized_keys
```
6. 测试连接
```
service sshd restart        //重启ssh服务(root用户才有权限)
exit                        //退出root用户，回到普通用户
ssh localhost               //连接普通用户测试
```
7. 配置远程主机ssh
```
scp ~/.ssh/id_rsa.pub 远程用户名@远程服务器IP:~/        //将公钥复制到远程服务器的~/目录下
```
8. 配置远程主机ssh，授权客户机登录
```
（若远程主机未创建ssh，可以执行 ssh-keygen -t rsa - 生成 .ssh/ 并授权 700）
cat ~/id_rsa.pub >> ~/.ssh/authorized_keys  //追加公钥到授权key中
rm ~/id_rsa.pub                             //保险起见，删除公钥
同样在134机器上重复第四步和第五步
service sshd restart                        //重启ssh服务 
```
9. 从客户机输入 ssh 主机IP 即可查看是否已设置成功
10. 若配置了ssh之后仍需要输入密码，请按照如下链接中的方式检验是否该服务器目录权限不是默认值
` http://zouqingyun.blog.51cto.com/782246/1874410/`

    `ll /gafe -ld //此处gafe为你需要登录的服务器用户默认目录 即 /home/gafe `

### 服务器定时执行脚本
```
crontab -e                                  //进入编辑器编辑定时任务
30 23 * * * sh ~/crontab_shell/task01.sh    //编辑器中加入此23:30会定时执行的任务
crontab -l                                  //启动定时任务
```
### 删除过期文件
- http://blog.csdn.net/zhouzhaoxiong1227/article/details/47124707

### ZSH配置
- http://yijiebuyi.com/blog/b9b5e1ebb719f22475c38c4819ab8151.html

### 设置快捷命令
```
alias cdw=`cd ~/Res`
source ~/.bashrc
```
### 查找僵尸进程及杀死僵尸进程
```
ps -A -ostat,ppid,pid,cmd | grep -e '^[Zz]'
-A 参数列出所有进程
-o 自定义输出字段 我们设定显示字段为 stat（状态）, ppid（进程父id）, pid(进程id)，cmd（命令）这四个参数
kill -HUP 12339         //选择先杀子进程，若杀不死再杀父进程 ,重跑 -hup为重跑 SIGHUB[1]
kill -9 12339           //直接杀死该进程
kill [ -s signal | -p ] [ -a ] pid ...
kill -l [ signal ]      //使用kill -l 可以显示信号列表
```

### 修改vim的编码设置
```
:set fileencoding       //查看现在文本的编码
:set fenc=编码          //转换当前文本的编码为指定的编码
:set enc=编码           //以指定的编码显示文本，但不保存到文件中。这里的“编码”常见为gbk utf-8 big5 cp936
:set ff?                //查看当前文本的模式类型，一般为dos,unix
:set ff=dos             //设置为dos模式,也可以用一下方式转换为unix模式
:%s/^M//g               //等同于:set ff=unix
```
### 后台挂起任务 nohup
```
- http://blog.chinaunix.net/uid-26785297-id-3375270.html
- 1, &              //例如 sh xxx.sh & ,将这个命令放在后台执行
- 2,ctrl+z          //将前台正在执行的任务放到后台执行并暂停
```
### 重定向，错误信息

- http://blog.csdn.net/woshinia/article/details/18040063

### dpkg 安装错误
```
dpkg: error: dpkg status database is locked by another process 解决方法
$ sudo rm /var/lib/dpkg/lock
$ sudo dpkg --configure -a
$ sudo rm /var/lib/apt/lists/lock
```
### 部署之在阿里云 ubuntu 主机上安装 Ruby on Rails 环境 (六)

- https://www.rails365.net/articles/bu-shu-zhi-zai-a-li-yun-ubuntu-zhu-ji-shang-an-zhuang-ruby-on-rails-huan-jing-liu
- 包含 安装nginx、安装git、安装redis、安装nodejs、安装mysql

### 在Shell中使用多进程和i线程处理任务
- http://bbs.51cto.com/thread-1104907-1-1.html
- http://bbs.51cto.com/thread-1104907-1-1.html




