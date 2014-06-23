FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy python python-cheetah ca-certificates wget

# Install SickRage 3a70a6effe (2014-06-22)
RUN mkdir /opt/sickrage
RUN wget https://github.com/echel0n/SickRage/tarball/3a70a6effe305a867d36549919f19c8866152449 -O /tmp/echel0n-SickRage-3a70a6e.tar.gz
RUN tar -C /opt/sickrage -xvf /tmp/echel0n-SickRage-3a70a6e.tar.gz --strip-components 1
RUN chown nobody:users /opt/sickrage

EXPOSE 8081

# SickRage Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# TV directory
VOLUME /tv

# Because running things as root is wrong
USER nobody
ENTRYPOINT ["python", "/opt/sickrage/SickBeard.py"]
CMD ["--datadir=/config"]
