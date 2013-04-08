eval "$(rbenv init -)"
PATH=.bundle/binstubs:$PATH

# PATH for MySQL
export PATH=/usr/local/mysql/bin:$PATH

# PATH for MongoDB
export PATH=/Applications/mongodb-osx-x86_64-2.0.0/bin:$PATH

# Add home dir scripts to the path
export PATH=~/bin:$PATH

# Add node binaries to path
export PATH=/usr/local/share/npm/bin:$PATH

# Set /usr/local/bin before /usr/bin for Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# Add rbenv shims
export PATH="$HOME/.rbenv/shims:$PATH"
