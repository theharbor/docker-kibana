FROM zoni/ubuntu
MAINTAINER Nick Groenen

ADD bin/build*.sh /
RUN /build1.sh && rm /build*.sh

ADD bin/start.sh /
EXPOSE 5601
ENTRYPOINT ["/start.sh"]
