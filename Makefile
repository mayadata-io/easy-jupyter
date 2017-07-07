# Makefile for building easy-jupyter container
# 
# Reference Guide - https://www.gnu.org/software/make/manual/make.html


#
# Internal variables or constants.
# NOTE - These will be executed when any make target is invoked.
#
IS_DOCKER_INSTALLED       := $(shell which docker >> /dev/null 2>&1; echo $$?)

help:
  @echo ""
	@echo "Usage:-"
	@echo "\tmake build             -- will build create the docker image"
	@echo ""


_build_check_docker:
	@if [ $(IS_DOCKER_INSTALLED) -eq 1 ]; \
		then echo "" \
		&& echo "ERROR:\tdocker is not installed. Please install it before build." \
		&& echo "" \
		&& exit 1; \
		fi;

deps: _build_check_docker
	@echo ""
	@echo "INFO:\tverifying dependencies for easy-jupyter ..."

_build_image:
	@echo "INFO: Building container image for easy-jupyter"
	build -t openebs/easy-jupyter .

_push_image:
	@echo "INFO: Publish container (openebs/easy-jupyter)"
	cd buildscripts && ./push

build: deps _build_image _push_image

#
# This is done to avoid conflict with a file of same name as the targets
# mentioned in this makefile.
#
.PHONY: help deps build 
.DEFAULT_GOAL := build
