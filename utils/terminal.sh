#### Check Disk ###################################################################################################

# inodes
$ df -i

# disk
$ df -h

#### Check open ports ##############################################################################################

$ netstat -atunp


#### Terminal's History ###########################################################################################

# last 10 elements history
$ history | tail

# find element on history
$ history | grep df

# 165  for file in *.txt; do libreoffice --convert-to "pdf" "$file"; done
# 233  history | grep pdf
# 234  for file in *.txt; do libreoffice --convert-to "pdf" "$file"; done
# 382  df -h

# execute the command 382: df -h
$ !382

# show the command 382:
$ !382:p

$ df -h

# reverse search
$ Ctrl + r

# execute the last command selected
$ !df

# show the last command executed
$ !!

# pass parameter to command
touch arq1

# first
$ ls -lha !^
# result touch arq1

# last 
$ ls -lha !$

# all
$ ls -lha !*

# param pos 2 last command's cp
$ ls -lha !cp:2

# all param last command's cp
$ ls -lha !cp:*

# remove from history
$ history -d 452

#### Check disk size ##############################################################################################

$ du -sh


#### Who am  I ####################################################################################################

$ whoami


#### Read Server Logs #############################################################################################

$ tail -f server/default/log/server.log | grep "something"

$ tail -n 1000 server/default/log/server.log

$ less server/default/log/server.log

$ cat /var/log/docker/containers/sonny/server.log | grep alguma coisa



#### Starts Java Servers ##########################################################################################

$ nohup ./run.sh -DappEnv=dev -c default -b 0.0.0.0 & 

$ nohup ./standalone.sh -DappEnv=dev -b 0.0.0.0 & 


#### Kill process #################################################################################################

$ ps aux | grep jboss  # (find proccess â€œpidâ€� )

$ ps -ef | grep firefox

# Or

$ jps (pids de processos java)

$ kill -9 "pid" "process' identification"

# Or

$ fuser -k 8080/tcp


#### Memory available #############################################################################################

$ free -m -t


#### Processor and Memory #########################################################################################

$ top

# ou

$ htop # press q

#### Check the port is open #######################################################################################

lsof -i tcp:5005


#### Add executable ###############################################################################################

$ chmod +x


#### Clean Debian's based distro ##################################################################################

$ sudo apt-get autoclean

$ sudo apt-get autoremove

$ sudo deborphan --guess-data | xargs sudo apt-get -y remove --purge

