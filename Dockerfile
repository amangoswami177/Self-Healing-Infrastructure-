FROM python:3.10-slim

WORKDIR /app

# Install Ansible and Docker CLI
RUN apt-get update && \
    apt-get install -y ansible docker.io curl sshpass && \
    apt-get clean

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "webhook_receiver.py"]
