#!/usr/bin/env zsh

# Customizable parameters.
PROMPT_PATH_MAX_LENGTH=30
PROMPT_DEFAULT_END=❯
PROMPT_ROOT_END=❯❯❯
PROMPT_SUCCESS_COLOR=$FG[071]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_VCS_NORMAL_COLOR=$FG[071]
PROMPT_VCS_UNSTAGED_COLOR=$fg[yellow]
PROMPT_VCS_STAGED_COLOR=$fg[cyan]

# Set required options.
setopt promptsubst

# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr "%{$PROMPT_VCS_UNSTAGED_COLOR%}"
zstyle ':vcs_info:*:*' stagedstr "%{$PROMPT_VCS_STAGED_COLOR%}"
zstyle ':vcs_info:*:*' actionformats "%S" "%r %{$PROMPT_VCS_NORMAL_COLOR%}%u%c(%b)%{$FX[reset]%} (%a) "
zstyle ':vcs_info:*:*' formats "%S" "%r %{$PROMPT_VCS_NORMAL_COLOR%}%u%c(%b)%{$FX[reset]%} "
zstyle ':vcs_info:*:*' nvcsformats "%~" ""

# Define prompts.
PROMPT="
%{$FG[242]%}#%{$FX[reset]%} %{$PROMPT_VCS_INFO_COLOR%}"'$vcs_info_msg_1_'"%{$FX[reset]%}%(0?.%{$PROMPT_SUCCESS_COLOR%}.%{$PROMPT_FAILURE_COLOR%})${SSH_TTY:+[%n@%m]}%{$FX[bold]%}%$PROMPT_PATH_MAX_LENGTH<..<"'${vcs_info_msg_0_%%.}'"%<<
%(!.$PROMPT_ROOT_END.$PROMPT_DEFAULT_END)%{$FX[no-bold]%}%{$FX[reset]%} "
RPROMPT=""
