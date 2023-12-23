cd ~/dots/
git add .
echo "Enter commit name for dots"
read commit
git commit -m "$commit"
git push -u origin main

cd ~/.config/nvim
git add .
echo "Enter commit name for neovim"
read neovim_commit
git commit -m "$neovim_commit"
git push -u origin main

cd ~/.config/emacs/
git add .
echo "Enter commit name for emacs"
read emacs_commit
git commit -m "$emacs_commit"
git push -u origin main
