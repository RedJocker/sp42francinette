#!/bin/bash

cd $HOME

mkdir temp_____

# download zip
curl -L0 https://github.com/xicodomingues/francinette/archive/refs/heads/master.zip -o ~/temp_____/francinette.zip
cd temp_____

unzip -qq francinette.zip

mv francinette-master francinette
cp -r francinette ..

cd $HOME
rm -rf temp_____

cd $HOME/francinette

# start a venv inside francinette
python3 -m venv venv

# activate venv
source venv/bin/activate

# install requirements
pip3 install -r requirements.txt

# set up the alias
grep "francinette" ~/.zshrc &> /dev/null
if [[ $? != 0 ]]; then
	echo "not present"
	echo "\nalias francinette=~/francinette/tester.sh" >> ~/.zshrc
fi

# print help
~/francinette/tester.sh

echo "Please close this terminal windown and open it again for francinette to work"