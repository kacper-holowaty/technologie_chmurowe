ARG PYTHON_VERSION=3.11

FROM python:${PYTHON_VERSION}

WORKDIR /myapp

COPY ./myapp /myapp

RUN pip install -r /myapp/requirements.txt

CMD ["python", "/myapp/app.py"]