# Use a minimal Python base image
FROM python:3.12-slim

# Create a non-root user and group
RUN addgroup --system appgroup && \
    adduser --system --ingroup appgroup appuser

# Set working directory
WORKDIR /app

# Copy application files
COPY simpletimeservice.py .

# Change ownership so the non-root user can access the files
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose the service port
EXPOSE 8080

# Run the microservice
CMD ["python", "simpletimeservice.py"]
