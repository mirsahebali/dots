cd ~/dots/ || return
git add .
echo "Enter commit name for dots"
read -r commit
git commit -m "$commit"
git push -u origin main
