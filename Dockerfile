FROM debian:buster
RUN apt update &&\
	apt -y install nginx &&\
	apt -y install tor &&\
	apt -y install openssh-server &&\
	apt -y install vim

COPY torrc /etc/tor/torrc

COPY index.html /usr/share/nginx/html/index.html

COPY nginx.conf /etc/nginx/nginx.conf

COPY sshd_config /etc/ssh/sshd_config

RUN useradd -m salecler

RUN echo "salecler:onion" | chpasswd

ENTRYPOINT nginx; service ssh start ; tor;
