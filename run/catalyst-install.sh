#!/bin/bash
echo "Build Deps: NPM, dpkg, rpm (fedora), apt (ubuntu/debian), rpmbuild"
which npm || exit
cd catalyst
npm install
echo "Building for your platform"
npm run tailwind:once
npm run make
cd out
cd make
cd
which apt || distrib=RPM
which rpm || distrib=DEB
which rpmbuild || exit
if [[ $distrib == "DEB" ]]
then
	cd deb
	cd x64
	sudo dpkg -i *.deb
fi

if [[ $distrib == "RPM" ]]
	cd deb
	cd x64
	sudo rpm -i *.rpm
fi
echo "Installed successfully"
