FROM zarkzork/ruby
MAINTAINER Vladimir Terekhov <zarkzork@gmail.com>

RUN apt-get update                                             && \
    apt-get install -y python supervisor python-pip supervisor && \
        pip install supervisor-stdout
