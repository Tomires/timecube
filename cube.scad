$fn=50;

module generate_outer_shell(size, radius){
    for (x = [-1, 1, 1])
        for (y = [-1, 1, 1])
            translate([x * size / 2, y * size / 2, 0])
                cylinder(r = radius, h = size, center = true);

    cube([size, size, size + radius * 2], center = true);
}

module generate_shell(size, radius){
    union(){
        /* generate corners */
        for (x = [-1, 1, 1])
            for (y = [-1, 1, 1])
                for (z = [-1, 1, 1])
                    translate([x * size / 2, y * size / 2, z * size / 2])
                        sphere(r = radius, center = true);

        generate_outer_shell(size, radius);

        rotate([90, 0, 0])
            generate_outer_shell(size, radius);

        rotate([90, 0, 90])
            generate_outer_shell(size, radius);
    }
}

module time_cube(size = 32, radius = 3.5, thickness = 5, hole_radius = 13.5, lip_radius = 2.5){
    difference(){
        union(){
            difference(){
                /* cube shell */
                generate_shell(size, radius);

                /* inside */
                generate_shell(size - thickness, radius);
            }

        /* reinforce side with the opening */
        translate([0, 0, size / 2])
            cube([size + radius, size + radius, 2], center = true);
        }

        /* outer hole diameter */
        translate([0, 0, size / 2 + radius - 0.5])
            cylinder(r = hole_radius, h = 1.05, center = true);

        /* lip openings */
        for (x = [-1, 1, 1])
            translate([x * hole_radius, 0, size / 2 + radius - 0.5])
                cylinder(r = lip_radius, h = 1.05, center = true);

        /* hole center diameter */
        translate([0, 0, size / 2 + radius - 1.75])
            cylinder(r = hole_radius + lip_radius, h = 1.5, center = true);

        /* inner hole diameter */
        translate([0, 0, size / 2 + radius - 0.5])
            cylinder(r = hole_radius - 2, h = thickness * 2, center = true);
    }

    /* inner hole filling */
    translate([0, 0, size / 2 + radius - 1.75])
        difference(){
            cylinder(r = hole_radius + lip_radius, h = 1.5, center = true);
            cylinder(r = hole_radius, h = 1.6, center = true);
            for (d = [0, 90, 180, 270])
                rotate([0, 0, d])
                    translate([hole_radius, 0, 0])
                        cylinder(r = lip_radius, h = 1.55, center = true);

            for (x = [-1, 1, 1])
            translate([x * size / 2, x * size / 2, 0])
                cube([size, size, 2], center = true);
        }
}

time_cube();
