FROM python:3.8-slim-buster

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /opt/bot

RUN python3 -m venv /opt/bot/venv
COPY ./requirements.txt /opt/bot/requirements.txt
RUN . /opt/bot/venv/bin/activate && pip install -r requirements.txt

COPY bot /opt/bot

CMD . /opt/bot/venv/bin/activate && exec python /opt/bot/bot.py