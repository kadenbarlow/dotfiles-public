alias documents="cd ~/Documents"
setopt null_glob
for i in ~/Documents/*/ ~/Documents/projects/*/ ~/Documents/work/*/; do
  for dir in $i; do
    dir=${dir%*/} # remove the trailing "/"
    alias ${dir##*/}="cd ${dir}"
  done
done
