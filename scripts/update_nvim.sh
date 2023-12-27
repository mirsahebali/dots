cd ~/.config/nvim || return
git add .
echo "Enter commit name for neovim"
read -r neovim_commit
git commit -m "$neovim_commit"
git push -u origin main
