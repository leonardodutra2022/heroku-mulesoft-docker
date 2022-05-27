FROM java:openjdk-8-jdk

ENV MULE_HOME=/opt/mule

WORKDIR $MULE_HOME

RUN wget https://s3.amazonaws.com/new-mule-artifacts/mule-ee-distribution-standalone-4.4.0.zip

RUN unzip mule-ee-distribution-standalone-4.4.0.zip

RUN mv mule-enterprise-standalone-4.4.0/* .

RUN rm mule-ee-distribution-standalone-4.4.0.zip

RUN rm -r mule-enterprise-standalone-4.4.0

COPY domains/* $MULE_HOME/domains/

COPY jar/api.jar $MULE_HOME/apps/

VOLUME $MULE_HOME/apps

VOLUME $MULE_HOME/conf

VOLUME $MULE_HOME/domains

VOLUME $MULE_HOME/logs

# HTTP Service Port
# Expose the necessary port ranges as required by the Mule Apps
#EXPOSE 8082-8091
#EXPOSE 9000
#EXPOSE 9082
#EXPOSE 8080/tcp

# Configure external access:
# HTTPS Port for Anypoint Platform communication
EXPOSE  443/tcp

EXPOSE 80/tcp

# Mule remote debugger
#EXPOSE 5000
# Mule JMX port (must match Mule config file)
#EXPOSE 1098
# Mule MMC agent port
#EXPOSE 7777
# AMC agent port
#EXPOSE 9997

# Mule Cluster ports
#EXPOSE 5701
#EXPOSE 54327
# HTTP Service Port
#EXPOSE 8081/tcp
# HTTPS Service Port
#EXPOSE 8091/tcp
# Start Mule runtime

# Start Mule runtime
CMD echo "------ Start Mule runtime --------"

# Environment and execution:
CMD ["/opt/mule/bin/mule", "-M-Dmule.agent.enabled=true", "-M-DPORT=$PORT"]