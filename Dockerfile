FROM ubuntu:16.04

ADD sources.list /etc/apt/sources.list
RUN rm -f /etc/apt/sources.list.d/*.list && \
    apt-get update && \
    apt-get install -y openssh-server && \
    echo '29' | apt-get install -y xorg && \
    apt-get install -y vim

RUN mkdir -p /var/run/sshd && \
	mkdir -p /root/.ssh && \
	echo 'root:123456' |chpasswd && \
	sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
	sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
	sed -i "s/^PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
	sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
	
ADD CLion-2018.2.3.tar.gz /usr/local
ADD clion.key /root/.CLion2018.2/config/clion.key

RUN echo "export PATH=/usr/local/clion-2018.2.3/bin:$PATH">> /etc/profile
ENV PATH /usr/local/clion-2018.2.3/bin:$PATH

ADD run.sh /home/run.sh
RUN chmod +x /home/run.sh
CMD ["/home/run.sh"]
