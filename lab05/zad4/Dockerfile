ARG PYTHON_VERSION

FROM alpine:${PYTHON_VERSION}

ARG PORT

ENV PORT=${PORT}

RUN apk update && apk add --no-cache python3 py3-pip

WORKDIR /app

COPY app/. /app

RUN pip3 install --no-cache-dir -r /app/requirements.txt

VOLUME app/data

ENV PYTHON_VERSION=${PYTHON_VERSION}

EXPOSE $PORT

CMD ["python3", "/app/app.py"]