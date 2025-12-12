if status is-interactive
    starship init fish | source
    alias ls='ls --color=auto'
    alias la='ls -a --color=auto'
    alias ll='ls -la --color=auto'
    alias grep='grep --color=auto'
end
