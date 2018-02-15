FROM python:2.7-alpine
MAINTAINER Mohd Nazeeb Khan <najeebagra@gmail.com>

ENV INSTALL_PATH /snakeeyes
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requriments.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "snakeeyes.app:create_app()"
