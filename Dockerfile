FROM ubuntu:latest
LABEL maintainer="lonlac@cril.fr"

#ENV http_proxy http://cache-adm.univ-artois.fr:8080/
#ENV https_proxy https://cache-adm.univ-artois.fr:8080/
#ENV HTTP_PROXY http://cache-adm.univ-artois.fr:8080/
#ENV HTTPS_PROXY https://cache-adm.univ-artois.fr:8080/

RUN apt-get -y update && apt-get install -y g++-4.9 \
    zlib1g-dev \
    build-essential \
    wget \
    zip

RUN wget http://www.labri.fr/perso/lsimon/downloads/softwares/glucose-3.0.tgz
RUN tar -xvzf glucose-3.0.tgz
RUN ls
RUN cd glucose-3.0/core/ && make 

ENTRYPOINT ["glucose-3.0/core/glucose"]
