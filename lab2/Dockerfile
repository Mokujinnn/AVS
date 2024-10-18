FROM alpine

RUN apk add build-base

WORKDIR /app

COPY main.cpp /app/main.cpp
RUN g++ main.cpp -o app

CMD [ "/app/app" ]