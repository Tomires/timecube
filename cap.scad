$fn=50;

union(){
    translate([0, 13.35, 0.1])
        cylinder(r = 2.5, h = 1.2, center=true);

    translate([0, -13.35, 0.1])
        cylinder(r = 2.5, h = 1.2, center=true);

    translate([0, 0, 0.75])
        difference(){
            cylinder(r = 13.35, h = 2.5, center=true);
            translate([0, 0, 2])
                cube([20, 3, 3], center = true);
        }
}
