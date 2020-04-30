#!/bin/sh

echo "Installing python libraries..."

# Upgrade pip
pip3 install --upgrade pip

# Install libraries
pip3 install jedi
pip3 install flake8
pip3 install autopep8
pip3 install numpy
pip3 install scipy
pip3 install astropy
pip3 install pandas
pip3 install dask[complete]
pip3 install ipython
pip3 install jupyter
pip3 install neovim
