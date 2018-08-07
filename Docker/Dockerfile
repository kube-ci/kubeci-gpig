FROM golang:alpine

RUN apk --update add git openssh curl && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh
ENTRYPOINT /usr/bin/run.sh

# docker build -t diptadas/github-pr-test .
# docker run --rm -it --env-file=.env diptadas/github-pr-test