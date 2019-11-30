FROM python:3.7

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONUNBUFFERED 1

MAINTAINER Jonhnatha Trigueiro <joepreludian@gmail.com>

RUN apt-get update && apt-get -y install python3-dev python3-setuptools libtiff5-dev libjpeg62-turbo-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk \
    libharfbuzz-dev libfribidi-dev default-libmysqlclient-dev libpq-dev python-dev libgeos-dev && apt-get clean all && \
    mkdir /.local /.cache /data && chmod 777 /.local /.cache /data

WORKDIR /data

RUN pip install --upgrade pip pipenv && chmod 777 -Rv /usr/local/lib/python3.7/site-packages

CMD ["pipenv"]
