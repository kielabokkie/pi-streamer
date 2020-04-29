FROM alexellis2/streaming:17-5-2017

RUN echo "Europe/Amsterdam" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

WORKDIR /usr/local/share/fonts
ADD fonts/OpenSans-Regular.ttf OpenSans-Regular.ttf
WORKDIR /

COPY entry.sh entry.sh
