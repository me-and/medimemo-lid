MediMemo pill box lid
=====================

This is an [OpenSCAD] file for printing replacement lids for [MediMemo pill organisers][MediMemo].

Usage
-----

OpenSCAD should be able to generate STL files straightforwardly.  If you want labels on the lids, just change the text in the `label` variable near the top.

If you have a multi-material printer, you can generate a pair of STL files, one containing the base and one containing the lettering, so you can have coloured letters rather than just indented letters.  You'll need to set the `DoPart` variable to `"letters"` for the letters part.  If you're using [PrusaSlicer][], import both files at once and you should get the option to set up the print as a single multi-material object rather than as two separate objects.

Alternatively, you can use `make`:

-   `make blank.stl` will create a lid with no text.
-   `make Tuesday.stl` will create a lid with the text "Tuesday".
-   `make Wednesday-letters.stl` will create the letters _only_ for a multi-material print of a lid with the text "Wednesday".
-   `make Thursday.stl Thursday-letters.stl` will create both files needed for a multi-material print of a lid with the text "Thursday".
-   `make all-base` will create a full English week's worth of lids.
-   `make all` will create a full English week's worth of lids as well as the lettering for multi-material prints.

If you want to use any other text, you can just change the filename in the `make` command and it should Just Work, provided you don't want to use the literal word "blank" or a word that ends with "-letters".  Non-ASCII characters seem to work for me in brief testing, but you might need to change the font in the OpenSCAD file.

If you don't have OpenSCAD installed but do have Docker[^1], add `USE_DOCKER=Yes` to the `make` arguments (e.g. `make USE_DOCKER=Yes Saturday.stl``).

Pre-rendered STL files
----------------------

If you don't want the hassle of building your own lids, I've [pre-rendered some with weekday names in English][prerendered].

[^1]: Let's be fair, very few people looking to build and print 3D models are likely to have Docker but not OpenSCAD.  This was partly an exercise in getting the same build environment on my local machine as on GitHub Actions, and partly just me playing around with [Alex Chan's suggested build process][Alex builds].

Credits
-------

Setting up the multi-material print is heavily based on [Jeff Barr's _Creating Multi-Extruder Designs in OpenSCAD for 3D Printing_][Barr]

[OpenSCAD]: http://www.openscad.org/
[MediMemo]: https://web.archive.org/web/20240424185129/https://www.mobilitysmart.co.uk/medimemo-weekly-pill-organiser.html
[prerendered]: https://gist.github.com/me-and/301d97648008bfb42f4573cb1a5ee3b4
[Alex builds]: https://alexwlchan.net/2017/building-your-repo/
[PrusaSlicer]: https://www.prusa3d.com/page/prusaslicer_424/
[Barr]: https://nextjeff.com/creating-multi-extruder-designs-in-openscad-for-3d-printing-6c43a002ef64
