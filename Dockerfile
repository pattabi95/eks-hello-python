#Build stage
FROM python:3.10-slim AS builder
WORKDIR /app

#Install dependencies
COPY app/requirements.txt .
RUN pip install -r requirements.txt

#Final stage
FROM python:3.10-slim
WORKDIR /app

#Copy installed pacakeges from builder
COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

#Copy app code
COPY /app .

EXPOSE 5000
CMD ["python","app.py"]
