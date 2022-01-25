FROM httpd:2.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    jq \
    && rm -r /var/lib/apt/lists/*

COPY ./public-html/ /usr/local/apache2/htdocs/

RUN chmod 644 /usr/local/apache2/htdocs/index.html

ADD bootstrap.sh /bootstrap.sh

RUN chmod +x /bootstrap.sh

CMD ["/bootstrap.sh"]