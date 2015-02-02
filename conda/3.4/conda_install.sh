URL=http://repo.continuum.io/miniconda/Miniconda3-3.8.3-Linux-x86_64.sh

# Install dir
PREFIX=$HOME/miniconda3
mkdir -p $PREFIX

# Download Miniconda
wget -q $URL -P $PREFIX

# Extract packages
cd $PREFIX
LINES=$(cat Miniconda* | grep 'MD5=' | cut -d' ' -f3)
tail -n $LINES Miniconda* | tar -xf -

extract_dist()
{
    echo "installing: $1 ..."
    DIST=pkgs/$(basename $1 .tar.bz2)
    mkdir -p $DIST
    bunzip2 -c ${DIST}.tar.bz2 | tar xf - -C $DIST
    rm -f ${DIST}.tar.bz2
}

for x in pkgs/*.tar.bz2; do extract_dist $x; done

# Install miniconda
mkdir $PREFIX/envs
mkdir $HOME/.continuum 2>/dev/null

PYTHON="$(ls $PREFIX/pkgs/python-*/bin/python) -E"
CONDA_INSTALL=$(ls $PREFIX/pkgs/conda-*/lib/python*/site-packages/conda/install.py)
$PYTHON $CONDA_INSTALL --prefix=$PREFIX --pkgs-dir=$PREFIX/pkgs --link-all

# config
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin
conda config --set always_yes True

# this is needed for libraries like sklearn
conda install -c https://conda.binstar.org/zhenxieit libstdcplus

## clean to reduce image size

# delete tests
find . -type d -name tests -depth -exec rm -rf {} \;
find . -type d -name test -depth -exec rm -rf {} \;

# remove .pyc
find . -name \__pycache__ -depth -exec rm -rf {} \;

# remove pkgs cache
rm -r pkgs/*

#remove installer
rm Miniconda*.sh
