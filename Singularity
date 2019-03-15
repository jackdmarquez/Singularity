Bootstrap: docker
From: ubuntu:16.04

%post
	apt-get -y update
	apt-get -y install build-essential
	apt-get -y install wget
	wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.2.tar.gz
	tar -xzvf openmpi-3.1.2.tar.gz
	cd openmpi-3.1.2
	mkdir build
	cd build
	../configure --prefix=/usr/local
	make -j4
	make install
	ldconfig
	which mpicc
	mpicc -show
	which mpiexec
	mpiexec --version
	apt-get -y install git
	apt-get install nano 
	apt-get install nfs-kernel-server
	apt-get install openssh-server
	cd	
	git clone https://github.com/wesleykendall/mpitutorial
	cd mpitutorial/tutorials/mpi-hello-world/code
	make
	
