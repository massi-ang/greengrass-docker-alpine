FROM node:6.16.0-alpine
ENV LANG=C.UTF-8

RUN apk add openjdk8-jre-base libc6-compat python2
RUN ln -s /usr/bin/node /usr/bin/nodejs6.10
RUN wget -O - https://d1onfpft10uf5o.cloudfront.net/greengrass-core/downloads/1.7.0/greengrass-linux-x86-64-1.7.0.tar.gz | tar xzf - -C /
RUN addgroup ggc_group && adduser -D ggc_user -G ggc_group
COPY startup.sh /
EXPOSE 8883
ENTRYPOINT ["/startup.sh"]
