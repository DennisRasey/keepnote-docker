# Keepnote Application

# docker run -d \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	--name keepnote \
#	keepnote

FROM debian:stretch

RUN \ 
    apt-get update && \
    apt-get install -y --no-install-recommends \
    keepnote && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV HOME /home/keepnote
RUN useradd --create-home --home-dir $HOME keepnote \
	&& chown -R keepnote:keepnote $HOME

WORKDIR $HOME
USER keepnote

ENTRYPOINT [ "keepnote" ]
