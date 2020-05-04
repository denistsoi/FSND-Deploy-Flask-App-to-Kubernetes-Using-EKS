FROM python:stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
COPY ./requirements.txt ./
RUN pip install -r requirements.txt

ENV JWT_SECRET="hello"
ENV LOG_LEVEL="DEBUG"

EXPOSE 8080

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]