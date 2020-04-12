FROM python:3.7-alpine as build

# Working directory where all the setup would take place in the image
WORKDIR /docker-basics

# The default user that should be used
USER root

# copy the Pipfile & pipfile.lock which contains dependencies to be installed
COPY ./Pipfile /docker-basics
COPY ./Pipfile.lock /docker-basics

# Install Alpine packages needed for the provisioning of the instance with python
# and other packages
RUN pip install --upgrade pip
RUN pip install pipenv
RUN apk -U update
RUN apk add --no-cache --update build-base
RUN apk add libpq


RUN apk add --no-cache --update --virtual=deps bash zlib-dev zlib bzip2-dev libffi libffi-dev gcc python3-dev musl-dev postgresql-dev libevent-dev gfortran py-pip build-base git && \
    export LC_ALL=C.UTF-8 && \
    export LANG=C.UTF-8

RUN pipenv install

USER root

# RUN export PATH="/root/docker-basics/start_api.sh:$PATH"
# && \
#  export PATH="/root/.pyenv /versions/3.6.5:$PATH"
RUN ls -ahl /root

RUN rm -rf .cache

COPY . .

# expose the port 8000
EXPOSE 8000
