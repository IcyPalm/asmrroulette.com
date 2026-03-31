FROM alpine:latest AS build-date
RUN apk add --no-cache git
COPY .git /app/.git
WORKDIR /app
RUN git log -1 --format='%ad' --date=format:'%B %d, %Y' > /tmp/build-date.txt

FROM nginx:alpine
COPY . /usr/share/nginx/html
COPY --from=build-date /tmp/build-date.txt /tmp/build-date.txt
RUN sed -i "s/__BUILD_DATE__/$(cat /tmp/build-date.txt)/" /usr/share/nginx/html/index.html && rm /tmp/build-date.txt
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD wget -qO- http://127.0.0.1/ || exit 1
