# Development tools

## Compiling

To build shared libraries:

    gcc -o <library> -shared <sources> -ldl
        -shared means to create a shared library
        -ldl means to use the libdl.so (dynamic shared library)

To build static libraries:

    gcc -c -o <output> <sources>
        -c means to create the static library

    ar rcs <library> <output>
        r means to inster with replacement
        c means to create a new archive
        s means to write an index

