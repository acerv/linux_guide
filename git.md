# Git handling

## Useful commands

To modify latest commit string:

    git commit --amend

To delete the latest 5 remote commits in the master branch:

    git push -f origin HEAD~5:master

## Perforce support

To install `git p4` command:

    wget http://git.kernel.org/cgit/git/git.git/plain/git-p4.py?id=master -O git-p4 && chmod +x git-p4
    sudo mv git-p4 /usr/lib/git-core/

To clone a depot locally:

    git p4 clone //depot/mydepot

## Setup gitolite credentials

Create the SSH keys. You may like to change `myuser@myhostname` as you wish:

    ssh-keygen -C "myuser@myhostname" -f ~/.ssh/gitolite
    chmod 0600 ~/.ssh/gitolite* # SSH doesn't accept 0640 permissions

Then configure SSH to reach the gitolite server using the right credentials:

    # add this in ~/.ssh/config
    hostname gitolite_server
        user myuser
        hostname gitolite_server_ip
        identityfile ~/.ssh/gitolite

## Creating a patch

To create a patch, commit changes and use the following command:

    git format-patch HEAD~
    
To apply the patch:
    
    git apply --stat fix_empty_poster.patch
