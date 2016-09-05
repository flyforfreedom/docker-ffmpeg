FROM alpine
MAINTAINER Rafał Krypa <rafal@krypa.net>

ENV FFMPEG_VERSION=3.1.3
ENV FFMPEG_URL=https://johnvansickle.com/ffmpeg/releases/ffmpeg-$FFMPEG_VERSION-64bit-static.tar.xz

RUN apk add --no-cache openssl;                              \
    wget -q $FFMPEG_URL -O - | tar xJC /tmp --no-same-owner; \
    apk del openssl;                                         \
    mv /tmp/ffmpeg*/ffmpeg /usr/local/bin/;                  \
    rm -rf /tmp/ffmpeg*/

ENTRYPOINT ["ffmpeg"]
CMD ["--help"]
