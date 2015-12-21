#!/bin/bash

for i in `ls .emacs.d/*.el`
do
    echo $i
    mv ~/$i ~/$i.keep
    ln -s $i ~/.emacs.d
done;
         
