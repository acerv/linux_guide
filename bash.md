# Bash programming

## Redirect Output

To redirecto the output to a file, and show the output on terminal as well:

    command | tee [-a] stdout.log


The following command works always, even if the command is redirecting stdout:

    command > >(tee stdout.log) 2> >(tee stderr.log >&2)


## Switch case

To define a switch-case:

    case $var in
    *) # all
        do_stuff1
    ;;
    something)
        do_stuff2
    ;;
    esac 


## Arrays

To initialize an array:

    declare -a array
    array=( one two three )


The number of elements:

    num_of_elements=${#array[*]}

    for (( i = 0 ; i < num_of_elements; i++ )): do
        echo ${array[i]}
    done

