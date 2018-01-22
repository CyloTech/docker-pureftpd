FROM stilliard/pure-ftpd

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD /run.sh -c 5 -C 50 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P ${PUBLICHOST} -p ${FIRST_PORT}:${LAST_PORT} -s -A -j -Z -H -4 -E -R -X -x

EXPOSE 21