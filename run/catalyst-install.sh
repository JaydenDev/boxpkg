#!/bin/bash
echo Build Deps: NPM
which npm || exit
cd catalyst
npm install
echo "Building for your platform"
npm run tailwind
npm run make
