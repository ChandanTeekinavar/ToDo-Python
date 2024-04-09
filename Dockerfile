FROM python:3.11.9-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Install Apache and mod_wsgi
RUN apt-get update && apt-get install -y apache2 libapache2-mod-wsgi-py3

# Enable mod_wsgi
RUN a2enmod wsgi

# Copy Apache configuration
COPY apache.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD service apache2 start && python app.py
