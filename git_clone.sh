#!/usr/bin/env bash
repository="$1"
path="$2"

if [ -z "$repository" ] || [ -z "$path" ]; then
  echo "Usage: git_clone [repository OR path]"
  exit 1
fi

echo "Cloning $repository to $path."
rm -rf $path && git clone $repository $path 2> /dev/null
echo "echo \"$repository $path\"" >> /docker-toolbox/git_list.sh
echo "# @path: $path" >> /docker-toolbox/_git_pull_all.sh
echo "# @repository: $repository" >> /docker-toolbox/_git_pull_all.sh
echo "#" >> /docker-toolbox/_git_pull_all.sh
echo "cd $path && git reset --hard && git pull" >> /docker-toolbox/_git_pull_all.sh
chmod +x /docker-toolbox/_git_pull_all.sh
