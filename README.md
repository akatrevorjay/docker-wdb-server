wdb.server, now with more Dockers
=================================

Easy way to add `wdb.server` support to any `Docker` dev env, especially via compose.

What's the dealio parmeggio
---------------------------

* Docker Hub: https://hub.docker.com/r/trevorj/wdb-server
* CircleCI: https://circleci.com/gh/akatrevorjay/docker-wdb-server

Why?
----

* Automated builds through CircleCI, pushed to Docker hub.
* Easy to use in your compose files (see below)


Examples (The goods)
--------------------

Using `docker-compose` version 1 syntax:

```yaml
your-app:
  environment:
    - WDB_NO_BROWSER_AUTO_OPEN=True
    - WDB_SOCKET_SERVER=wdb
    - WDB_WEB_SERVER=localhost
    - WDB_WEB_PORT=1984
  links:
    - wdb

wdb:
  image: trevorj/wdb-server
  ports:
    - "1984:1984"
```

Simple version 2:

```yaml
version: '2.1'
services:
  your-app:
    environment:
      - WDB_NO_BROWSER_AUTO_OPEN=True
      - WDB_SOCKET_SERVER=wdb
      - WDB_WEB_SERVER=localhost
      - WDB_WEB_PORT=1984
    links:
      - wdb

  wdb:
    image: trevorj/wdb-server
    ports:
      - "1984:1984"
```

Using `network_mode` of `your-app` allows for easier configuration:

```yaml
version: '2.1'
services:
  your-app:
    environment:
      - WDB_NO_BROWSER_AUTO_OPEN=True
    links:
      - wdb

  wdb:
    image: trevorj/wdb-server
    network_mode: "service:your-app"
    ports:
      - "1984:1984"
```

