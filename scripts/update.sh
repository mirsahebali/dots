cd ~/dots/
git add .
echo "Enter commit name"
read commit
git commit -m "$commit"
git push -u origin main
