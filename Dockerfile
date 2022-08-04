FROM python:3.7.5-slim-buster
MAINTAINER sacha cousin <careconciergefr@gmail.com>

ENV INSTALL_PATH /careflaskapp
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN pip install --editable .
CMD gunicorn --access-logfile - "careflaskapp.app:create_app()"
 