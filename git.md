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

