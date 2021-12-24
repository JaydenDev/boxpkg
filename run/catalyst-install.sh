#!/bin/bash
echo Build Deps: NPM
which npm || exit
cd catalyst
npm install
echo "Building for your platform"
npm run tailwind:once
npm run make
cd out
cd make
cd x64
which dpkg || distrib=RPM
which rpm || distrib=DEB
if [[ $distrib == "DEB" ]]
then
	cd deb
	sudo dpkg -i *.deb
fi

if [[ $distrib == "RPM" ]]
	cd deb
	sudo rpm -i *.rpm
fi
echo Installed succesfuly 
