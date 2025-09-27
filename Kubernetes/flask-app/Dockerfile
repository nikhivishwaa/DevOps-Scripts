FROM python:3.11-alpine

WORKDIR /app

EXPOSE 5000

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

ENTRYPOINT ["python", "app.py"]
