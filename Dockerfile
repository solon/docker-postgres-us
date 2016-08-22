# Install PostgreSQL 9.5 with en_IE.UTF-8 locale
FROM postgres:9.5
RUN localedef -i en_IE -c -f UTF-8 -A /usr/share/locale/locale.alias en_IE.UTF-8
ENV LANG en_IE.utf8

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf

# And add 'listen_addresses' to '/etc/postgresql/9.5/main/postgresql.conf'
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

RUN mkdir /dbdata && touch /dbdata/x
RUN chown -R postgres:postgres /dbdata
VOLUME /dbdata
