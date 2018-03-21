# /etc/skel/.bash_profile
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

export PATH="$HOME/.cargo/bin:$PATH"

if [ -d /usr/local/opt/coreutils/libexec/gnubin ] ; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
fi
