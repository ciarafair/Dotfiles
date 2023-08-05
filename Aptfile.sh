# █████  ██████  ████████
#██   ██ ██   ██    ██
#███████ ██████     ██
#██   ██ ██         ██
#██   ██ ██         ██

#!/usr/bin/env aptfile

# trigger an apt-get update
update

# install some packages
package "build-essential"
package "git-core"
package "software-properties-common"

package "curl"
package "wget"
package "vim"
package "zsh"
package "tmux"
package "htop"
package "autoconf"
package "automake"
package 'lolcat'
package 'pipes-sh'
package 'fortune'
package 'cowsay'
package 'figlet'

# you can also execute arbitrary bash
echo "Completed"
