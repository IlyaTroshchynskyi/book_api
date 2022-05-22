FROM python:3.8.10-alpine
# setup environment variable
WORKDIR /usr/src/books

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev && apk add libffi-dev && apk add libffi-dev


# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt



# copy project
COPY . .