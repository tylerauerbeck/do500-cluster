FROM registry.redhat.io/codeready-workspaces/devfileregistry-rhel8:2.0

RUN mkdir /var/www/html/devfiles/99_DO500
COPY  devfile.yaml meta.yaml /var/www/html/devfiles/99_DO500/
RUN 

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/local/bin/rhel.entrypoint.sh"]
