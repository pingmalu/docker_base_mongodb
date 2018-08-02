FROM reg.qiniu.com/pub/docker_base
MAINTAINER MaLu <malu@malu.me> 

WORKDIR /root

# Install packages
RUN apt-get update && \
    apt install -y mongodb && \
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小.
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    # */

VOLUME ["/app"]

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

