DOCKER = docker

all: Monday.stl Tuesday.stl Wednesday.stl Thursday.stl Friday.stl Saturday.stl Sunday.stl

.docker/build: Dockerfile
	$(DOCKER) build --tag openscad .
	mkdir -p .docker
	touch .docker/build

%.stl: medimemo-lid.scad .docker/build
	$(DOCKER) run --rm --volume $$(pwd):/build openscad -o $@ -D label=\"$(@:.stl=)\" $<
