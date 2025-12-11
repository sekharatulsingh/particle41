FROM python:3.12-slim

RUN addgroup --system appgroup && \
    adduser --system --ingroup appgroup appuser

WORKDIR /app

COPY src/ ./src/

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

CMD ["python", "src/simpletimeservice.py"]
