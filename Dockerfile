FROM confluentinc/cp-ksql-cli

ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 2.1.0

RUN apt update && apt upgrade -y

RUN apt install -y curl tar \
  && curl -sL \
    -o kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
  && tar xf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

RUN useradd -u 1000 -ms /bin/bash kafkauser \
  && echo "alias ll='ls -l'" >> /home/kafkauser/.bashrc \
  && echo "alias la='ls -A'" >> /home/kafkauser/.bashrc \
  && echo "alias l='ls -CF'" >> /home/kafkauser/.bashrc \
  && mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} /home/kafkauser/ \
  && mkdir /usr/logs/ \
  && chown -R kafkauser /home/kafkauser/ \
  && chown -R kafkauser /etc/ksql-cli/ \
  && chown -R kafkauser /usr/share/java/ksql-cli/ \
  && chown -R kafkauser /usr/share/java/cp-base-new/ \
  && chown -R kafkauser /usr/logs/ \
  && chown -R kafkauser /var/log/ksql-cli

USER 1000

WORKDIR /home/kafkauser/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin

# Overwrite default `ksql` command
ENTRYPOINT [""]
