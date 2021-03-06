echo "Updating...... 12%"
sudo apt-get -y update
sudo apt-get -y install build-essential
sudo apt-get -y install wget
echo "Installing OpenMpi...........24%"
mkdir /tmp/openmpi && \
cd /tmp/openmpi && \
wget https://www.open-mpi.org/software/ompi/v4.0/downloads/openmpi-4.0.0.tar.gz && \
tar zxf openmpi-4.0.0.tar.gz && \
cd openmpi-4.0.0 && \
./configure --enable-orterun-prefix-by-default && \
make -j $(nproc) all && \
sudo make install && \
sudo ldconfig && \
rm -rf /tmp/openmpi
echo "Installing Other Components...........38%"
sudo apt-get -y install git && \
sudo apt-get -y install nano  && \
sudo apt-get -y install nfs-kernel-server && \
sudo apt-get -y install openssh-server 
cd 
echo "Copying OpenMpi examples........... 50%"     
git clone https://github.com/wesleykendall/mpitutorial && \
cd mpitutorial/tutorials/mpi-hello-world/code && \
make
echo "Installing Singularity........... 62%"
sudo apt-get update && \
sudo apt-get install -y build-essential \
libssl-dev uuid-dev libgpgme11-dev libseccomp-dev pkg-config squashfs-tools
export VERSION=1.11.5 OS=linux ARCH=amd64
echo "Installing GO........... 74% "
wget -O /tmp/go${VERSION}.${OS}-${ARCH}.tar.gz https://dl.google.com/go/go${VERSION}.${OS}-${ARCH}.tar.gz && \
sudo tar -C /usr/local -xzf /tmp/go${VERSION}.${OS}-${ARCH}.tar.gz
echo 'export GOPATH=${HOME}/go' >> ~/.bashrc && \
echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ~/.bashrc && \
source ~/.bashrc
echo "Configuring Singularity........... 88%"
mkdir -p ${GOPATH}/src/github.com/sylabs && \
cd ${GOPATH}/src/github.com/sylabs && \
git clone https://github.com/sylabs/singularity.git && \
cd singularity
cd ${GOPATH}/src/github.com/sylabs/singularity && \
  ./mconfig && \
  cd ./builddir && \
  make && \
  sudo make install
git checkout v3.1.0
singularity version
echo "If there were no errors, consider it done........... 100%"
