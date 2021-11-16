FROM ubuntu:20.04
MAINTAINER cht.andy@gmail.com
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Taipei
RUN set -eux \
  && mv /bin/sh /bin/sh.old && ln -s /bin/bash /bin/sh \
  && apt-get update \
  && apt-get install --assume-yes locales cron curl tzdata \
  && rm -rf /var/lib/apt/lists/* && apt-get clean \
  && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
CMD ["/usr/sbin/cron", "-f", "-L", "15"]


