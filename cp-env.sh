#!/bin/bash

PWD=`pwd`
for i in `ls .emacs.d/*.el`
do
    echo $i
    mv ~/$i ~/$i.keep
    ln -s $PWD/$i ~/.emacs.d
done;
