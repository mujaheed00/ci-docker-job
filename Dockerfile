FROM alpine:latest

WORKDIR /app

COPY app.txt /app/app.txt

CMD ["cat", "/app/app.txt"]
