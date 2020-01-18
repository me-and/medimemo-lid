MediMemo pill box lid
=====================

This is an [OpenSCAD] file for printing replacement lids for [MediMemo pill organisers][MediMemo].

Usage
-----

To print these lids, you will normally need to convert the OpenSCAD files into something your 3D printer can use.  There are typically two steps to this: creating a stereolithograph (STL) file, which describes the 3D shapes in the specific lid you want to print, then "slicing" the STL file to produce the set of instructions your 3D printer will actually use.

The easiest way to build the STL files is to use Make from the command line.  If you have OpenSCAD installed and want a lid that says "Wednesday", just run:

    make Wednesday.stl

Alternatively, if you don't have OpenSCAD but do have Docker (I expect, but haven't tested, that drop-in replacements for Docker like Podman will Just Work), try:

    make USE_DOCKER=Yes Wednesday.stl

If you want an unlabelled lid, just specify the output filename as `blank.stl`.

For slicing the STL files to get something your printer can use, you're on your own, as that depends a lot on the specifics of your printer.  Personally, I use [Slic3r].

Pre-rendered STL files
----------------------

If you don't want the hassle of building your own lids, I've [pre-rendered some with weekday names in English][prerendered].

[OpenSCAD]: http://www.openscad.org/
[MediMemo]: http://amzn.eu/0sNxdws?tag=meand-21
[Slic3r]: https://slic3r.org/
[prerendered]: https://gist.github.com/me-and/7380ee68cbc2d1b75518041dd6efa087
