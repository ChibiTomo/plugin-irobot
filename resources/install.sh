PROGRESS_FILE=/tmp/dependancy_irobot_in_progress
if [ ! -z $1 ]; then
	PROGRESS_FILE=$1
fi

touch ${PROGRESS_FILE}
echo 0 > ${PROGRESS_FILE}
echo "********************************************************"
echo "*             Installation des dépendances             *"
echo "********************************************************"
echo ""
echo "--------- Installing NVM"
echo ""
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash 2>&1
echo 50 > ${PROGRESS_FILE}
if [[ $NVM_DIR = "" ]]; then
    export NVM_DIR="$HOME/.nvm"
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
echo ""
echo "--------- Installing NodeJS"
echo ""
echo 75 > ${PROGRESS_FILE}

echo ""
echo "--------- Checking for dorita980"
echo ""

if [[ $(npm list -g | grep -E "dorita980" | wc -l) < 1 ]]; then
    echo ""
    echo "--------- Installing dorita980"
    echo ""
    npm install -g dorita980 2>&1
else    
    echo ""
    echo "--------- dorita980 already installed"
    echo ""
fi
echo 100 > ${PROGRESS_FILE}
echo "********************************************************"
echo "*             Installation terminée                    *"
echo "********************************************************"
rm ${PROGRESS_FILE}