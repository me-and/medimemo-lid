depth = 1.5;

big_end_width = 20;
bottom_width = 18;
top_width = 17;
short_end_width = top_width;

big_end_len = 9.6;
short_end_len = 9.4;
total_len = 93.4;
centre_len = total_len - big_end_len - short_end_len;
echo(big_end_len=big_end_len, short_end_len=short_end_len, centre_len=centre_len, total_len=total_len);

big_end_radius = 4;
short_end_radius = 3;

text = "Sunday";
text_border = 2;
font="Helvetica Neue";
stretch = 1.5;
text_depth = 0.5;

frag = 90;

difference() {
    rotate([90,0,180])
    {
        rotate([0,0,0])
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

        rotate([0,0,0])
        {
            %translate([-short_end_width/2, 0, big_end_len + centre_len])
            cube([short_end_width, depth, short_end_len]);

            translate([short_end_width/2 - short_end_radius,
                        0,
                        total_len - short_end_radius])
            rotate([270, 0, 0])
            cylinder(h=depth, r=short_end_radius, $fn=frag);

            translate([short_end_radius - short_end_width/2,
                       0,
                       total_len - short_end_radius])
            rotate([270, 0, 0])
            cylinder(h=depth, r=short_end_radius, $fn=frag);

            translate([-short_end_width/2, 0, big_end_len + centre_len])
            cube([short_end_width, depth, short_end_len - short_end_radius]);

            translate([-short_end_width/2 + short_end_radius, 0, total_len - short_end_radius])
            cube([short_end_width - 2*short_end_radius, depth, short_end_radius]);
        }
    }

    // Double the depth since we're taking a difference and that means there's no "surface" to worry about.
    #translate([0, 1.5*big_end_len, depth - text_depth])
    linear_extrude(height=text_depth*2)
    scale([1, stretch, 1])
    rotate([0,0,-90])
    text(text, halign="right", valign="baseline", size=top_width/2 - text_border, font=font, $fn=frag);
}
