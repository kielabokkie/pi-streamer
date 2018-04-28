FROM alexellis2/streaming:17-5-2017

WORKDIR /usr/local/share/fonts
ADD fonts/OpenSans-Regular.ttf OpenSans-Regular.ttf
WORKDIR /

COPY entry.sh entry.sh
