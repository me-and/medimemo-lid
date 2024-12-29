all: all-base all-letters

all-base: Monday.stl Tuesday.stl Wednesday.stl Thursday.stl Friday.stl Saturday.stl Sunday.stl
all-letters: Monday-letters.stl Tuesday-letters.stl Wednesday-letters.stl Thursday-letters.stl Friday-letters.stl Saturday-letters.stl Sunday-letters.stl

DOCKER = docker
OPENSCAD = openscad

ifeq ($(USE_DOCKER),Yes)
	BUILD_CMD = $(DOCKER) run --rm --volume $$(pwd):/build $(OPENSCAD)
	DOCKER_DEP = .docker/build
else
	BUILD_CMD = $(OPENSCAD)
	DOCKER_DEP =
endif

$(DOCKER_DEP): Dockerfile
	$(DOCKER) build --tag openscad .
	mkdir -p .docker
	touch .docker/build

blank.stl: medimemo-lid.scad $(DOCKER_DEP)
	$(BUILD_CMD) -o $@ $<

%-letters.stl: medimemo-lid.scad $(DOCKER_DEP)
	$(BUILD_CMD) -o $@ -D label=\"$(@:-letters.stl=)\" -D DoPart=\"letters\" $<

%.stl: medimemo-lid.scad $(DOCKER_DEP)
	$(BUILD_CMD) -o $@ -D label=\"$(@:.stl=)\" -D DoPart=\"body\" $<
