# generate ssh key
$ ss-keygen -t ed25519 -C "fernando.romulo.silva@gmail.com" -f ~/.ssh/id_rsa_github_fernando.romulo.silva

# check ssh agent
$ eval "$(ssh-agent -s)"

# add key to ssh list
$ ssh-add ~/.ssh/id_resa_github_fernando.romulo.silva

# List the keys
$ ssh-add -L

# remove key
$ ssh-add -D ~/.ssh/id_rsa_github_fernando.romulo.silva

# copy to transfer area
$ clip < ~/.ssh/id_rsa_github_fernando.romulo.silva.pub
# add it to server


# Inside the ~/ssh folder create a 'config' file:
#-------------------------------------------------------------
# Personal github account
Host github.com-fernando.romulo.silva
PreferredAuthentications publickey
User git
AddkeystoAgent yes
IdentifyFile ~/.ssh/id_rsa_github_fernando.romulo.silva

Host bitbucket.org-fernando.romulo.silva
PreferredAuthentications publickey
User git
AddkeystoAgent yes
IdentifyFile ~/.ssh/id_rsa_bitbuket_fernando.romulo.silva
#-------------------------------------------------------------

# check connection with server
$ ssh -Tvvv git@github.com

# Clone
$ git clone git@github.com-fernando.romulo.silva:fernando.romulo.silva/fernando-romulo-silva.git

# To specific repository add the user and email to match with server
$ git config user.name "Fernando Romulo da Silva"
$ git config user.email "fernando.romulo.silva@gmail.com"

