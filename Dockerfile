FROM rwhaling/scala-native-alpine:0.1.0-sbt
RUN apk --update add uwsgi-cgi

RUN mkdir -p /dinosaur-project-build /output /output/usr/lib /usr/lib/cgi-bin
ADD . /dinosaur-project-build
WORKDIR /dinosaur-project-build

RUN sbt clean nativeLink && \
    mv /dinosaur-project-build/target/scala-2.11/*-out /usr/lib/cgi-bin/dinosaur-build-out

ADD cgi.ini /usr/lib/cgi-bin/cgi.ini
WORKDIR /usr/lib/cgi-bin

ENTRYPOINT ["bash", "-c"]
CMD ["uwsgi --ini cgi.ini"]
