FROM python:3
MAINTAINER Elias Torres <eltodi@gmail.com>

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install vim sudo python-setuptools virtualenvwrapper python-pip python-dev libjpeg-dev nginx libxml2-dev libxslt-dev python-dev
RUN pip install --upgrade pip
RUN apt-get -y install supervisor redis-server git unzip openssh-server openssl python-psycopg2
RUN ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib
RUN useradd -m -d /home/django -p $(openssl passwd -1 'temp') -G sudo -s /bin/bash django
RUN su django
RUN cd /home/django

RUN mkdir /home/django/proyecto
RUN chown -R django: /home/django/proyecto/
RUN mkdir /home/django/virtualenv
RUN chown -R django: /home/django/virtualenv/

WORKDIR /home/django/proyecto

RUN echo "export WORKON_HOME=/home/django/virtualenv" >> /home/django/.bashrc
RUN echo "source /usr/share/virtualenvwrapper/virtualenvwrapper.sh" >> /home/django/.bashrc
RUN echo "alias pmr='python manage.py runserver 0.0.0.0:8000'" >> /home/django/.bashrc
RUN echo "alias pms='python manage.py shell'" >> /home/django/.bashrc

RUN service supervisor start

EXPOSE 8000
EXPOSE 22
