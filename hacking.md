# Hacking stuff 

## ELF - Executable and Linkable Format

[ELF on Wikipedia](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)

It's the standard binary file format for Unix and Unix-like systems and
it defines the following file structure for executables:

* ELF header: 
    * generic informations 
    * program headers address
    * section headers address

* program headers:
    * generic informations
    * segments: structs to prepare for system execution

* section headers:
    * symbols:    connects symbolic definitions with symbolic references
        * .text: functions definitions
        * .data: variables definitions
    * relocation: connects a function with its address

To see the ELF definition:

    readelf -a <executable|library>

To obtain library symbols:

    objdump -TC <library name>.so

## Reverse Engeneering

To print all strings inside files:

    strings <executable>

To see debugging symbols inside files:

    nm <executable>

    In the 2nd column its shown (capitals = globals):
        - t|T symbols in the .text code section
        - b|B symbols in the .data section (UN-initialized)
        - d|D symbols in the .data section

To trace the library functions calls (ordered):

    ltrace <executable>

To trace system functions calls (ordered):

    $ strace <executable>

Both strace and ltrace supports the following arguments:
* -f:       follow forks
* -p <pid>: attaches to a process

## Stripping

Stripping is used *to remove symbols table and to reduce executables files size.*
This procedure can be used *to make executables less debuggable.*

    strip -s <executable> [-o <new exec>] # remove symbols table
    strip -s -p <executable>              # remove symbols and preserve date
    strip --strip-debug <executable>      # remove debug symbols
    strip -R <section> <executable>       # remove a section (ie .gnu.version)
    strip --strip-unneeded <executable>   # remove unneeded stuff
    strip -s -K <symbol> <executable>     # remove a symbol from stripping
    strip -N <symbol> <executable>        # remove a particular symbol

## Overwrite functions

*LD_PRELOAD* allows to add a library to a particular execution 
of the program. The function in this library will overwrite the actual 
library function:

    gcc -o my_prog my_prog.c
    ./my_prog

    Hello there!
    
    gcc -shared -o mylibrary.so fake_lib.c -ldl
    LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH \
      LD_PRELOAD=mylibrary.so \
      ./my_prog

    I hate you!

