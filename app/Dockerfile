#Build stage
FROM python:3.10-slim AS builder
WORKDIR /app

#Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

#Final stage
FROM python:3.10-slim

WORKDIR /app

#Copy installed pacakeges from builder
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

#Copy application code
COPY app.py .

EXPOSE 8080
CMD ["python","app.py"]
