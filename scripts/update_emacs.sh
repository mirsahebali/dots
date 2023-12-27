cd ~/.config/emacs/ || return
git add .
echo "Enter commit name for emacs"
read -r emacs_commit
git commit -m "$emacs_commit"
git push -u origin main
