all: Monday.stl Tuesday.stl Wednesday.stl Thursday.stl Friday.stl Saturday.stl Sunday.stl

DOCKER = docker

ifeq ($(USE_DOCKER),Yes)
	BUILD_CMD = $(DOCKER) run --rm --volume $$(pwd):/build openscad
	DOCKER_DEP = .docker/build
else
	BUILD_CMD = openscad
	DOCKER_DEP =
endif

.docker/build: Dockerfile
	$(DOCKER) build --tag openscad .
	mkdir -p .docker
	touch .docker/build

%.stl: medimemo-lid.scad $(DOCKER_DEP)
	$(BUILD_CMD) -o $@ -D label=\"$(@:.stl=)\" $<
