#!/bin/bash

# this uitility is to ease deploying configurations to the Linux system.
# in processing, you would be need to login as administrator account.
#
# i wrote this script with reference to the link ( http://tldp.org/LDP/abs/html/ )


# this fucntion copies a file safely.
# if target file is same with source file, do not copy.
# if not same, back-up the target file and then do copying.

function safe_copy () {
  local $epoch
  epoch=`date +%s`

  local $diff
  diff=`diff $1 $2`

  if [ $diff ]
  then
    # backup target file
    cp $2 $2.$epoch

    # overwrite target file
    cp $1 $2
  fi
}

function do_debian ()
{
  git 
  safe_copy vim-debian/.vimrc ~/.vimrc
}

function do_ubuntu ()
{
  # not implemented
  exit 0
}



########## START HERE.. 

dist_string=`cat /etc/issue`
dist_name=${dist_string:0:6}

case "$dist_name" in 

  Debian  )
    do_debian
    ;;

  Ubuntu  )
    do_ubuntu
    ;;

esac


