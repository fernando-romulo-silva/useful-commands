#### Terminal's History ###########################################################################################

history | grep something

#### Read Server Logs #############################################################################################

tail -f server/default/log/server.log | grep "something"

tail -n 1000 server/default/log/server.log

less server/default/log/server.log

#### Starts Java Servers ##########################################################################################

nohup ./run.sh -DappEnv=dev -c default -b 0.0.0.0 & 

nohup ./standalone.sh -DappEnv=dev -b 0.0.0.0 & 

#### Kill java process ############################################################################################

ps aux | grep jboss  # (find proccess “pid” )

# Or

jps (pids de processos java)

kill -9 "pid" -> numero do processo

export PATH=$PATH:/java/jdk1.6.0_24/bin

#### Memoria existente e utilizada da maquina #####################################################################

free -m -t

#### Processador e Memoria ########################################################################################

top # press F1

# ou

htop # press F1


#### Clean Debian's based distro ##################################################################################

sudo apt-get autoclean

sudo apt-get autoremove

sudo deborphan --guess-data | xargs sudo apt-get -y remove --purge