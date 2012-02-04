#if [ $SHLVL = 1 ];then
# x: 複数ターミナルで1つのスクリーンを共有, R:screenが起動してない場合に自動起動, U: UTF-8モード
#screen -xRU
#fi

# The following lines were added by compinstall
zstyle :compinstall filename '/home/shinichi/.zshrc'

## history
HISTFILE="$HOME/.zhistory"
HISTSIZE=10000                  # ファイルサイズ
SAVEHIST=10000                  # saveする量
setopt extended_history         # 拡張フォーマットで保存する。 コマンド入力時刻、実行時間も同時に保存される
setopt hist_ignore_dups         # コマンドラインが直前のものと同一なら登録しない
setopt hist_reduce_blanks       # 余分なスペースを削除する
function history-all { history -E 1 }

## emacs key bind
bindkey -e

# コマンドに応じてオプションや引数の補完候補が表示
autoload -Uz compinit
compinit

# 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

# ディレクトリスタック
setopt auto_pushd               # 移動したディレクトリを記録
setopt pushd_ignore_dups        # 同ディレクトリを履歴に追加しない
setopt auto_cd                  # auto change directory
# exclude some pattern using ~
# example: rm *.o~hoge.o
setopt extended_glob

# 補完
setopt list_packed              # 補完候補を詰めて表示
setopt auto_list                # 候補が複数ある時に自動的に一覧を出す
setopt list_types               # 候補一覧ファイル種別表示
# setopt correct                  # コマンドのスペルミスを指摘

# history 操作まわり

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

stty start undef                # C-qはデフォルトで端末の出力再開に割り当てられているため無効にする

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
    0)
        PROMPT="%{${fg[green]}%}[%n@%m] %B%{${fg[cyan]}%}%/%{${reset_color}%}
[%n]# "
        PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
        SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
        [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[red]}%}${HOST%%.*} ${PROMPT}"
        ;;
    *)
        PROMPT="%{${fg[green]}%}[%n@%m] %{${fg[red]}%}%/%{${reset_color}%}
%% "
        PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
        SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
        [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[red]}%}${HOST%%.*} ${PROMPT}"
        ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm|screen-bce)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
