FROM qserv/stack:debian_latest
MAINTAINER Fabrice Jammes <fabrice.jammes@in2p3.fr>

USER root
# eups/eupspkg and MariaDB dependencies
RUN apt-get -qq update && apt-get -qq install git patch cmake libncurses5-dev liblzma-dev zlib1g-dev
# TODO is libxml2 useful?

# For debugging purpose
RUN apt-get -qq install vim

USER qserv
RUN mkdir -p /home/qserv/src/mariadb
COPY eups-build.sh /home/qserv/
CMD ["bash", "/home/qserv/eups-build.sh"]
