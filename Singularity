Bootstrap: docker
From: ubuntu:16.04

%post
	apt-get -y update
	apt-get -y install build-essential
	apt-get -y install wget
	mkdir /tmp/openmpi && \
    	cd /tmp/openmpi && \
    	wget https://www.open-mpi.org/software/ompi/v4.0/downloads/openmpi-4.0.0.tar.gz && \
    	tar zxf openmpi-4.0.0.tar.gz && \
    	cd openmpi-4.0.0 && \
    	./configure --enable-orterun-prefix-by-default && \
    	make -j $(nproc) all && \
    	make install && \
    	ldconfig && \
	rm -rf /tmp/openmpi
	apt-get -y install git
	apt-get -y install nano 
	apt-get -y install nfs-kernel-server
	apt-get -y install openssh-server
	cd	
	git clone https://github.com/wesleykendall/mpitutorial
	cd mpitutorial/tutorials/mpi-hello-world/code
	make
	
