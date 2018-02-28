all: Monday.stl Tuesday.stl Wednesday.stl Thursday.stl Friday.stl Saturday.stl Sunday.stl

%.stl: medimemo-lid.scad
	openscad -o $@ -D label=\"$(@:.stl=)\" $<
