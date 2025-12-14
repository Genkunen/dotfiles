if status is-interactive
    starship init fish | source
    alias ls='ls --color=auto'
    alias la='ls -a --color=auto'
    alias ll='ls -la --color=auto'
    alias grep='grep --color=auto'
end

set -x PATH "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin" $PATH

# Created by `pipx` on 2025-12-13 23:53:31
set PATH $PATH /home/genkunen/.local/bin

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/genkunen/.ghcup/bin $PATH # ghcup-env