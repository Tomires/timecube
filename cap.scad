$fn=50;

union(){
    translate([0, 11.5, 0])
        cylinder(r = 2, h = 1, center=true);

    translate([0, -11.5, 0])
        cylinder(r = 2, h = 1, center=true);

    translate([0, 0, 0.75])
        difference(){
            cylinder(r = 11.5, h = 2.5, center=true);
            translate([0, 0, 2])
                cube([20, 3, 3], center = true);
        }
}
