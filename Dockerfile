FROM nginx:alpine
ARG BUILD_DATE=""
COPY . /usr/share/nginx/html
RUN if [ -n "$BUILD_DATE" ]; then \
      sed -i "s/__BUILD_DATE__/$BUILD_DATE/" /usr/share/nginx/html/index.html; \
    else \
      sed -i "s/__BUILD_DATE__/$(date +'%B %d, %Y')/" /usr/share/nginx/html/index.html; \
    fi
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD wget -qO- http://127.0.0.1/ || exit 1
