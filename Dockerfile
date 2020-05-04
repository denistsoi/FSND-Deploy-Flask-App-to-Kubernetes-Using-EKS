FROM python:stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
COPY ./requirements.txt ./
RUN pip install -r requirements.txt

ENV JWT_SECRET="something"
ENV LOG_LEVEL="DEBUG"

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]