# Gunakan image dasar Squid Proxy
FROM ubuntu:latest

# Install Squid Proxy
RUN apt-get update && \
    apt-get install -y squid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Salin konfigurasi Squid ke dalam container
COPY squid.conf /etc/squid/squid.conf

# Expose port Squid
EXPOSE 3128

# Jalankan Squid Proxy
CMD ["squid", "-N"]
