#!/bin/bash
# Setup
add-apt-repository universe
add-apt-repository multiverse
apt-get update
apt-get upgrade -y
# VSCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-get install -y code
# Git
apt-get install -y git-all
# R
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
apt-get install -y r-base libssl-dev libxml2-dev libcurl4-openssl-dev
R -e 'install.packages("tidyverse")'
# RStudio
apt-get install -y libc6=2.31-0ubuntu9.2
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1717-amd64.deb -O rstudio.deb
dpkg -i rstudio.deb
rm rstudio.deb
# Fix broken installation (TODO: fix this)
apt-get --fix-broken install -y
# Conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p /opt/miniconda
chmod ugo+w /opt/miniconda
ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
source /etc/profile.d/conda.sh
rm miniconda.sh
# Python
conda activate
conda install -c conda-forge python=3.8 jupyterlab numpy pandas matplotlib seaborn scikit-learn
conda deactivate
# Julia
wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.1-linux-x86_64.tar.gz
tar zxvf julia-1.6.1-linux-x86_64.tar.gz
rm julia-1.6.1-linux-x86_64.tar.gz
mv julia-1.6.1 /opt
ln -s /opt/julia-1.6.1/bin/julia /usr/local/bin/julia
julia -e 'using Pkg; Pkg.add("IJulia")'
# Solaar
apt-get install -y solaar
# Cubic
apt-add-repository -y ppa:cubic-wizard/release
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
apt-get install -y cubic
# UNetbootin
add-apt-repository -y ppa:gezakovacs/ppa
apt-get install unetbootin
