FROM nginx

RUN chmod 744 wrapper.sh

COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
