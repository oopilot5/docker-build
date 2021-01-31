FROM ubuntu:18.04

# ADD sources.list /etc/apt/sources.list
# RUN rm -f /etc/apt/sources.list.d/*.list && \
RUN apt-get update && \
    apt-get install -y openssh-server && \
    echo '29' | apt-get install -y xorg && \
    apt-get install -y vim

RUN mkdir -p /var/run/sshd && \
    mkdir -p /root/.ssh && \
    echo 'root:123456' |chpasswd && \
    sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
    sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config && \
    sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
    
# install Clion
# ADD CLion-2018.2.3.tar.gz /usr/local
# ADD clion.key /root/.CLion2018.2/config/clion.key
# 
# RUN echo "export PATH=/usr/local/clion-2018.2.3/bin:$PATH">> /etc/profile
# ENV PATH /usr/local/clion-2018.2.3/bin:$PATH
# 
# RUN echo 'if [ `grep -c jetbrains /etc/hosts` -eq 0 ];then' >> /etc/profile &&\
#     echo '  echo "0.0.0.0 account.jetbrains.com" >> /etc/hosts' >> /etc/profile &&\
#     echo 'fi' >> /etc/profile

# install astyle
RUN apt-get update && apt-get install -y build-essential gdb cmake git
ADD astyle_3.1_linux.tar.gz /astyle
ADD install-astyle.sh /astyle/install-astyle.sh
RUN /bin/sh /astyle/install-astyle.sh

# install zsh
RUN echo "export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu:/usr/local/lib${LD_LIBRARY_PATH}\n" >> /etc/profile
ADD zsh.tar.gz /zsh
ADD install-ohmyzsh.sh /zsh/install-ohmyzsh.sh
ADD zsh-autosuggestions.tar.gz /zsh
ADD zsh-syntax-highlighting.tar.gz /zsh
ADD install-zsh.sh /zsh/install-zsh.sh
RUN /bin/sh /zsh/install-zsh.sh

RUN sed -i "s/X11DisplayOffset 10/#X11DisplayOffset 10/g" /etc/ssh/sshd_config &&\
    echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

RUN apt update && apt install -y default-jdk nodejs npm
RUN apt update && apt install -y iproute2 net-tools

ADD run.sh /home/run.sh
RUN chmod +x /home/run.sh
CMD ["/home/run.sh"]
