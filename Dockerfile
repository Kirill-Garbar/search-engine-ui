FROM python:3.6.8-alpine3.9

ENV APP_HOME /search_engine_ui
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN pip install -r ${APP_HOME}/requirements.txt

WORKDIR $APP_HOME/ui

ENV MONGO mongodb
ENV MONGO_PORT 27017
ENV FLASK_APP ui.py

ENTRYPOINT ["gunicorn", "ui:app", "-b", "0.0.0.0"]
