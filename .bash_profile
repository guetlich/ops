source ~/.bashrc

# only run this on the hosts i specify
if [[ `hostname` == "falcon11.serverfarm.cornell.edu" ]] ; then

        #is this variable null?
        #that is, if we are not already in a TMUX session, try to reattach one
        if [ -z $TMUX ] ; then
                tmux attach -d
        fi

        #if the above command failed, and there is still no TMUX session running,
        #  start a new one
        #
        #in retrospect, this was a very odd way to write this logic,
        #  and i don't recall at all why i did it this way.
        #  but it works, so ...
        if [ $? -ne 0 ] && [ -z $TMUX ] ; then
                tmux
        fi
        
        #otherwise do nothing

fi
