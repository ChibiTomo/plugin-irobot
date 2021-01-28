if [[ $NVM_DIR = "" ]]; then
    export NVM_DIR="$HOME/.nvm"
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

node -v
if [[ ! $? -eq 0 ]]; then
    echo "Cannot find node"
fi

npm -v
if [[ ! $? -eq 0 ]]; then
    echo "Cannot find npm"
fi

if [[ $(npm list -g | grep -E "dorita980" | wc -l) < 1 ]]; then
    echo "Cannot find dorita980"
fi

echo 0
