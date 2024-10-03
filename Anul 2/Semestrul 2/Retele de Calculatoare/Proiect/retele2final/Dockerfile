FROM python:3.9-slim

WORKDIR /retele2

COPY . . 
# Instalează dependențele necesare, inclusiv Scapy
RUN pip install scapy

# Rulează scriptul Python
CMD ["python", "dns.py"]
