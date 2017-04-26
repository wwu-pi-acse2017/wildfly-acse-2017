FROM jboss/wildfly

EXPOSE 8080 9990 8787

USER jboss
RUN /opt/jboss/wildfly/bin/add-user.sh -u admin -p docker#admin --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--debug", "8787", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

ADD hsqldb.jar /deploymenttmp/
ADD executeInWildflyCli.sh /deploymenttmp/
ADD commands.cli /deploymenttmp/

RUN /deploymenttmp/executeInWildflyCli.sh