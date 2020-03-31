FROM tomcat:latest

MAINTAINER Anil Thanki, Anil.Thanki@earlham.ac.uk

RUN cd /usr/local/bin/ \
    && wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.10.0/ncbi-blast-2.10.0+-x64-linux.tar.gz \ 
    && tar zxvpf ncbi-blast-2.10.0+-x64-linux.tar.gz \ 
    && rm ncbi-blast-2.10.0+-x64-linux.tar.gz

RUN apt-get -y update && apt-get install -y build-essential

RUN apt-get install -y libdbd-mysql-perl

RUN mkdir /blastdb

ADD blastdb /blastdb

RUN for f in $(ls /blastdb/); do /usr/local/bin/*ncbi*/bin/makeblastdb -dbtype nucl -in /blastdb/$f; done;
