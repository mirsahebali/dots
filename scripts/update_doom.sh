cd ~/.config/doom/ || return
git add .
echo "Enter commit name for doom emacs"
read -r commit
git commit -m "$commit"
git push -u origin main
