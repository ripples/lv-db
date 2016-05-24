FROM mysql:5.7.5

#RUN apt-get -qq update
#RUN apt-get -qq netcat

EXPOSE 3306

ADD create_db_if_needed.sh /usr/local
ADD db-structure.sql /usr/local/
ADD db-create.sql /usr/local

RUN ["chmod", "+x", "usr/local/create_db_if_needed.sh"]
CMD ["usr/local/create_db_if_needed.sh"]
