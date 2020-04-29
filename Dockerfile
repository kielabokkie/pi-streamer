FROM alexellis2/streaming:17-5-2017

RUN echo "Europe/Amsterdam" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

COPY entry.sh entry.sh
