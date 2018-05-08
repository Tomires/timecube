$fn=50;

union(){
    translate([0, 13.15, 0.1])
        cylinder(r = 1.9, h = 1.2, center=true);

    translate([0, -13.15, 0.1])
        cylinder(r = 1.9, h = 1.2, center=true);

    translate([0, 0, 0.75])
        difference(){
            cylinder(r = 12.9, h = 2.5, center=true);
            translate([0, 0, 1.25])
                cube([20, 3, 3], center = true);
        }
}
