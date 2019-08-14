HOOK_NAMES="applypatch-msg pre-applypatch post-applypatch pre-commit prepare-commit-msg commit-msg post-commit pre-rebase post-checkout post-merge pre-receive update post-receive post-update pre-auto-gc"
GIT_HOOK_DIR=../.git/hooks
LOCAL_HOOK_DIR=./git-hooks
LNS_RELATIVE_PATH=../../dev/git-hooks

echo "Installing project git hooks"

for hook in $HOOK_NAMES; do
    if [ -f $LOCAL_HOOK_DIR/$hook ]; then
      echo "> Hook $hook"
      if [ ! -h $GIT_HOOK_DIR/$hook -a -x $GIT_HOOK_DIR/$hook ]; then
          echo " > Old git hook $hook disabled"
          mv $GIT_HOOK_DIR/$hook $GIT_HOOK_DIR/$hook.local
      fi
      echo " > Enable project git hook"
      ln -s -f $LNS_RELATIVE_PATH/$hook $GIT_HOOK_DIR/$hook
    fi
    echo "Complete"
done