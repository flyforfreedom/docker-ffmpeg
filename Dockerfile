FROM alpine
MAINTAINER Rafał Krypa <rafal@krypa.net>

ENV FFMPEG_VERSION=git-20160813
ENV FFMPEG_URL=http://johnvansickle.com/ffmpeg/builds/ffmpeg-$FFMPEG_VERSION-64bit-static.tar.xz

RUN wget -q $FFMPEG_URL -O - | tar xJC /tmp --no-same-owner; \
    mv /tmp/ffmpeg*/ffmpeg /usr/local/bin/;                  \
    rm -rf /tmp/ffmpeg*/

ENTRYPOINT ["ffmpeg"]
CMD ["--help"]
