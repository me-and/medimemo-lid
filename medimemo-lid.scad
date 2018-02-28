depth = 1.5;

big_end_width = 20;
bottom_width = 18;
top_width = 17;
small_end_width = top_width;

big_end_len = 9.6;
small_end_len = 9.4;
total_len = 93.4;
centre_len = total_len - big_end_len - small_end_len;
echo(big_end_len=big_end_len, small_end_len=small_end_len,
     centre_len=centre_len, total_len=total_len);

big_end_radius = 4;
small_end_radius = 3;

label = "";
label_border = 2;
font="Helvetica Neue";
stretch = 1.5;
label_depth = 0.5;

frag = 90;

difference()
{
    rotate([90,0,180])
    {
        union()
        {
            %
            translate([-big_end_width/2, 0, 0])
            cube([big_end_width, depth, big_end_len]);

            translate([big_end_width/2 - big_end_radius, 0, big_end_radius])
            rotate([270, 0, 0])
            cylinder(h=depth, r=big_end_radius, $fn=frag);

            translate([big_end_radius - big_end_width/2, 0, big_end_radius])
            rotate([270, 0, 0])
            cylinder(h=depth, r=big_end_radius, $fn=frag);

            translate([-big_end_width/2 + big_end_radius, 0, 0])
            cube([big_end_width - 2*big_end_radius, depth, big_end_radius]);

            translate([-big_end_width/2, 0, big_end_radius])
            cube([big_end_width, depth, big_end_len - big_end_radius]);
        }

        translate([-bottom_width/2, 0, big_end_len])
        linear_extrude(height=centre_len)
        polygon([[0, 0],
                 [bottom_width, 0],
                 [(bottom_width + top_width)/2, depth],
                 [(bottom_width - top_width)/2, depth]]);

        union()
        {
            %
            translate([-small_end_width/2, 0, big_end_len + centre_len])
            cube([small_end_width, depth, small_end_len]);

            translate([small_end_width/2 - small_end_radius,
                        0,
                        total_len - small_end_radius])
            rotate([270, 0, 0])
            cylinder(h=depth, r=small_end_radius, $fn=frag);

            translate([small_end_radius - small_end_width/2,
                       0,
                       total_len - small_end_radius])
            rotate([270, 0, 0])
            cylinder(h=depth, r=small_end_radius, $fn=frag);

            translate([-small_end_width/2, 0, big_end_len + centre_len])
            cube([small_end_width, depth, small_end_len - small_end_radius]);

            translate([-small_end_width/2 + small_end_radius,
                       0,
                       total_len - small_end_radius])
            cube([small_end_width - 2*small_end_radius,
                  depth,
                  small_end_radius]);
        }
    }

    // Double the depth since we're taking a difference and that means there's
    // no "surface" to worry about.
    #
    translate([0, 1.5*big_end_len, depth - label_depth])
    linear_extrude(height=label_depth*2)
    scale([1, stretch, 1])
    rotate([0,0,-90])
    text(label, halign="right", valign="baseline",
         size=top_width/2 - label_border, font=font, $fn=frag);
}
