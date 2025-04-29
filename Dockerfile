FROM python:3.9-slim

WORKDIR /Myapp
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
