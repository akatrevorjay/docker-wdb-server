FROM trevorj/boilerplate
MAINTAINER Trevor Joynson "<docker@trevor.joynson.io>"

RUN lazy-apt --no-install-recommends \
    python3 python3-pip python3-wheel python3-venv python3-setuptools \
    python3-psutil python3-pyinotify python3-tornado

COPY image "$IMAGE_ROOT"

ENV VIRTUAL_ENV="$IMAGE_ROOT"
RUN python3 -m venv --symlinks --system-site-packages "$VIRTUAL_ENV"

RUN pip3 install wdb.server

# http frontend, websocket backend
EXPOSE 1984 19840
CMD ["wdb.server.py"]

