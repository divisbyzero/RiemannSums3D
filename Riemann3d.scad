//===================================================
// Calculus 3D Models: Riemann Sum for Functions of Two Variables
// Author: https://github.com/divisbyzero
// Description: 
//    This script generates a 3D printable model of a Riemann sum approximation 
//    for a function of two variables over a rectangular domain.
//
//    Easily modify the function, domain, subdivisions, or scaling below.
//===================================================

//----------------------------
// User Settings
//----------------------------

// Choose ONE function file to include.
// Uncomment one line and keep the other commented.
include <functions/monkey_saddle.scad>;
// include <functions/sombrero.scad>;

/* [Domain] */

// Minimum x value
xmin = -2.5;
// Maximum x value
xmax = 2.5;
// Minimum y value
ymin = -2.5;
// Maximum y value
ymax = 2.5;

/* [Subdivisions] */

// Number of subdivisions in x (higher = finer resolution)
nx = 29;
// Number of subdivisions in y
ny = 29;

/* [Scaling] */

// Final model width in mm (x direction); height and depth scale proportionally
targetxwidth = 80;
// Exaggerates vertical features
verticalscalefactor = 0.04;
// Shifts surface upward to ensure positive heights
verticaltranslation = 20;

/* [Function Parameters] */

// Decay constant (used by sombrero; ignored by monkey saddle)
k = 0.18;

//----------------------------
// Derived Scaling Parameters (Do Not Edit Unless Needed)
//----------------------------

domain_width = xmax - xmin;
domain_depth = ymax - ymin;
aspect_ratio = domain_depth / domain_width;

targetywidth = targetxwidth * aspect_ratio;

xscale = targetxwidth / domain_width;
yscale = targetywidth / domain_depth;
zscale = xscale;  // Maintain proportional scaling in x, y, and z

dx_math = domain_width / nx;
dy_math = domain_depth / ny;

dx_phys = dx_math * xscale;
dy_phys = dy_math * yscale;

// Scaled and translated function
function g(x, y) = zscale * (verticalscalefactor * f(x, y)) + verticaltranslation;

//----------------------------
// Riemann Prism Generator
//----------------------------
module riemann_prism(i, j) {
    x0 = xmin + i * dx_math;
    y0 = ymin + j * dy_math;
    z = g(x0 + dx_math/2, y0 + dy_math/2);

    translate([0, 0, 0.01])  // Slight lift to avoid base artifacts
        cube([dx_phys, dy_phys, z], center = false);
}

//----------------------------
// Riemann Surface Assembly
//----------------------------
module riemann_surface() {
    for (i = [0 : nx - 1])
        for (j = [0 : ny - 1]) {
            x_phys = (xmin + i * dx_math - xmin) * xscale;
            y_phys = (ymin + j * dy_math - ymin) * yscale;

            translate([x_phys, y_phys, 0])
                riemann_prism(i, j);
        }
}

//----------------------------
// Final Model Assembly
//----------------------------
module final_model() {
    union() {
        // Thin floor for printability and watertightness (1 mm thick)
        cube([targetxwidth, targetywidth, 1], center = false);
        riemann_surface();
    }
}

//----------------------------
// Build the Model
//----------------------------
final_model();
