$fa = 1;
$fs = 0.4;

// slider widget for number in range
angle1 = 60; // [10:100]

cart();
translate([ 24 - 4.7, 24 / 2 - 5.7 / 2, 30 ]) articulator();

module cart() {
    sheet_thickness = .75; // Nominal , not actual
    height = 30;
    depth = 24;
    width = 24;

    // sides
    sheet(height, depth);
    translate([ width, 0, 0 ]) sheet(height, depth);
    // back
    color("blue", 1) translate([ 0, depth, 0 ]) rotate(-90, [ 0, 0, 1 ])
        sheet(height, width);

    // bottom and top
    rotate(90, [ 0, 1, 0 ]) sheet(width + sheet_thickness, depth);
    translate([ 0, 0, height ]) rotate(90, [ 0, 1, 0 ])
        sheet(width + sheet_thickness, depth);

    // wheels
    wheel_radius = 1.5;
    wheel_depth = 2;
    two_wheels();
    translate([ 0, depth - wheel_depth, 0 ]) two_wheels();

    module sheet(height, depth) { cube([ sheet_thickness, depth, height ]); }

    module two_wheels() {
        translate([ wheel_radius, wheel_depth, -wheel_radius ])
            rotate(90, [ 1, 0, 0 ]) cylinder(h = 2, r = wheel_radius);
        translate([
            wheel_radius + 24 - 2 * wheel_radius + sheet_thickness, wheel_depth,
            -wheel_radius
        ]) rotate(90, [ 1, 0, 0 ]) cylinder(h = 2, r = wheel_radius);
    }
}

module articulator() {

    // base
    color("green", 1) cube([ 4.7, 5.4, 1 ]);

    module pivot() {
        color("green", 1) translate([ 1.25, 5.4 / 2, 1 - .001 ])
            cylinder(h = 1 + .002, r = 1.25);
        translate([ 1.25, 5.4 / 2, 2 - .001 ]) cylinder(h = 1 + .002, r = 1.25);
    }

    // pivot1
    pivot();
    // arm1
    translate([ 1.25, 5.4 / 2, 2.5 - .001 ]) rotate(45, [ 0, 1, 0 ])
        translate([ -.5, 0, 0 ]) cylinder(h = 10, r = 1.25);
    // pivot2
    translate([ 6.5, 0, 8.5 ]) pivot();
    // short 45deg section
    translate([ 7.5, 5.4 / 2, 8.5 + 2.5 ]) rotate(45, [ 0, 1, 0 ])
        cylinder(h = 2, r = 1.25);

    translate([ 8.5, 5.4 / 2 - 1.25 - .25, 8.5 + 2.5 + 2.5 ])
        rotate(angle1, [ 0, 1, 0 ]) translate([ -.2, 0, -.5 ])
            cube([ 3, 3, 10 ]);
}

x1 = 5.4;
z1 = 9.7;

// reset vp

//$vpr=[52.9, 0, 34.6];
//$vpt=[18.817, -11.4073, 22.8374];
//$vpd=268.585;

//$vpr=[60, 0, 27.5];
//$vpt=[10.35, -13, 13];
//$vpf=26;
//$vpd=22;
