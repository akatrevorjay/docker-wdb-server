
# trusty is missing python3-venv, oh well
UBUNTU_TAGS := latest yakkety xenial
TAGS := $(UBUNTU_TAGS)

include Makefile.docker
