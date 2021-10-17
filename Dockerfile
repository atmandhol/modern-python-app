FROM python:3.7-alpine
RUN apk update && apk add build-base libffi-dev openssl-dev
COPY . /app
WORKDIR /app
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE $PORT
CMD ["gunicorn", "main:app", "--workers=5", "--threads=4", "--keep-alive=60", "--worker-class=gthread"]