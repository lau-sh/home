declare CUSTOM_FUNCTIONS_SCRIPT="$ZSH_CUSTOM/custom-functions.zsh"

if [ -f $CUSTOM_FUNCTIONS_SCRIPT ]; then
    source $CUSTOM_FUNCTIONS_SCRIPT

    alias 203='connectInternal 203'
    alias 205='connectInternal 205'
    alias 209='connectInternal 209'
    alias 211='connectInternal 211'
    alias 213='connectInternal 213'
    alias 217='connectInternal 217'
    alias 215='connectInternal 215'
    alias 223='connectInternal 223'

else
    echo "$CUSTOM_FUNCTIONS_SCRIPT not found.  Server aliases not set."
fi
