FROM node:8-alpine
ENV LANG=C.UTF-8
COPY startup.sh /
RUN apk add openjdk8-jre-base libc6-compat python2 && \
	ln -s /usr/local/bin/node /usr/bin/nodejs6.10 && \
	ln -s /usr/bin/java /usr/bin/java8 
RUN wget -O - https://d1onfpft10uf5o.cloudfront.net/greengrass-core/downloads/1.8.0/greengrass-linux-x86-64-1.8.0.tar.gz | tar xzf - -C / && \
	addgroup ggc_group && adduser -D ggc_user -G ggc_group
EXPOSE 8883
ENTRYPOINT ["/startup.sh"]
