function sp {
  git branch > /dev/null 2>&1 || return 1
  git config user.initials
}

POWERLEVEL9K_DIR_BACKGROUND='237'
POWERLEVEL9K_CUSTOM_GIT_PAIR="echo \$(sp)"
POWERLEVEL9K_CUSTOM_GIT_PAIR_BACKGROUND="clear"
POWERLEVEL9K_CUSTOM_GIT_PAIR_FOREGROUND="blue"
POWERLEVEL9K_CUSTOM_GIT_PAIR_ICON="\uf7af"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="012"
POWERLEVEL9K_DIR_FOREGROUND='010'
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="012"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="012"
POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{008}/%F{cyan}"

POWERLEVEL9K_DIR_ETC_BACKGROUND="clear"
POWERLEVEL9K_ETC_ICON='%F{blue}\uf423'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"

POWERLEVEL9K_GO_ICON="\uf7b7"
POWERLEVEL9K_GO_VERSION_BACKGROUND='clear'
POWERLEVEL9K_GO_VERSION_FOREGROUND='081'

# POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir dir_writable_joined custom_git_pair vcs_joined)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable_joined custom_git_pair vcs)
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%F{008}\uf460%F{008}'

POWERLEVEL9K_LINUX_MANJARO_ICON="\uf312 "
POWERLEVEL9K_LINUX_UBUNTU_ICON="\uf31b "

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" \uf101 "

POWERLEVEL9K_NVM_BACKGROUND='clear'
POWERLEVEL9K_NVM_FOREGROUND='green'

POWERLEVEL9K_OS_ICON_BACKGROUND='clear'
POWERLEVEL9K_OS_ICON_FOREGROUND='cyan'

POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=false

POWERLEVEL9K_CUSTOM_KUBE_PS1='kube_ps1'
POWERLEVEL9K_CUSTOM_KUBE_PS1_BACKGROUND='clear'
KUBE_PS1_SYMBOL_ENABLE='false'
KUBE_PS1_SUFFIX=''
KUBE_PS1_PREFIX=''

#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_kube_ps1 context)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_kube_ps1)
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{008}\uf104%F{008}'

POWERLEVEL9K_SHORTEN_DELIMITER='%F{008} …%F{008}'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"

POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="001"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_BACKGROUND="clear"
POWERLEVEL9K_CARRIAGE_RETURN_ICON="\uf071"

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m}"

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='clear'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='clear'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='clear'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='green'
POWERLEVEL9K_VCS_LOADING_FOREGROUND='clear'
POWERLEVEL9K_VCS_LOADING_BACKGROUND='clear'

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='clear'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='clear'
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='clear'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='clear'
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND='clear'

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='>'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=

POWERLEVEL9K_VCS_GIT_HOOKS=
POWERLEVEL9K_VCS_BOOKMARK_ICON=
POWERLEVEL9K_VCS_COMMIT_ICON=
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=
POWERLEVEL9K_VCS_GIT_ICON=
POWERLEVEL9K_VCS_HG_ICON=
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=
POWERLEVEL9K_VCS_LOADING_ICON=
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=
POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=
POWERLEVEL9K_VCS_STAGED_ICON=
POWERLEVEL9K_VCS_STASH_ICON=
POWERLEVEL9K_VCS_SVN_ICON=
POWERLEVEL9K_VCS_TAG_ICON=
POWERLEVEL9K_VCS_UNSTAGED_ICON=
POWERLEVEL9K_VCS_UNTRACKED_ICON=
