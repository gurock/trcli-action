FROM python:3.10.12-alpine
RUN apk add gcc musl-dev bash
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
