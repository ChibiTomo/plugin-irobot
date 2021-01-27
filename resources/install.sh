PROGRESS_FILE=/tmp/dependancy_irobot_in_progress
if [ ! -z $1 ]; then
	PROGRESS_FILE=$1
fi
touch ${PROGRESS_FILE}
echo 0 > ${PROGRESS_FILE}
echo "********************************************************"
echo "*             Installation des dépendances             *"
echo "********************************************************"
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
echo 50 > ${PROGRESS_FILE}
if [[ $NVM_DIR = "" ]]; then
    export NVM_DIR="$HOME/.nvm"
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node
echo 100 > ${PROGRESS_FILE}
echo "********************************************************"
echo "*             Installation terminée                    *"
echo "********************************************************"
rm ${PROGRESS_FILE}