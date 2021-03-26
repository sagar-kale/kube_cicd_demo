FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

RUN chmod 744 wrapper.sh

CMD ["./wrapper.sh"]
