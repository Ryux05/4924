# Gunakan image dasar Squid Proxy
FROM ubuntu:latest

# Install Squid Proxy dan apache2-utils untuk htpasswd
RUN apt-get update && \
    apt-get install -y squid apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    htpasswd -bc /etc/squid/passwords myuko loveyou

# Salin konfigurasi Squid ke dalam container
COPY squid.conf /etc/squid/squid.conf

# Expose port Squid
EXPOSE 3128

# Jalankan Squid Proxy
CMD ["squid", "-N"]
