# Git handling

## Perforce support

To install `git p4` command:
```sh
    wget http://git.kernel.org/cgit/git/git.git/plain/git-p4.py?id=master -O git-p4 && chmod +x git-p4
    sudo mv git-p4 /usr/lib/git-core/
```
To clone a depot locally:
```sh
    git p4 clone //depot/mydepot
```
