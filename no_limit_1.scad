//===================================================
// No Limit 1: Riemann Sum Model
// Main entry file with all user-editable parameters.
//===================================================

/* [Function Parameters] */

// f(x, y) = ((x^2 - y^2)/(x^2 + y^2))^2, with f(0,0) defined as 0.
function f(x, y) = (x == 0 && y == 0)
    ? 0
    : pow((x*x - y*y) / (x*x + y*y), 2);

/* [Display] */

// true = Riemann sum prisms, false = smooth function surface
render_riemann = false;

/* [Scaling] */

// Final model width in mm (x direction); height and depth scale proportionally
targetxwidth = 80;
// Exaggerates vertical features
verticalscalefactor = 1.5;
// Shifts surface upward to ensure positive heights
verticaltranslation = 2;

/* [Domain] */

// Minimum x value
xmin = -3;
// Maximum x value
xmax = 3;
// Minimum y value
ymin = -3;
// Maximum y value
ymax = 3;

/* [Subdivisions] */

// Number of subdivisions in x (higher = finer resolution)
nx = 29;
// Number of subdivisions in y
ny = 29;
// Smooth-mode subdivisions in x (used only when render_riemann = false)
smooth_nx = 200;
// Smooth-mode subdivisions in y (used only when render_riemann = false)
smooth_ny = 200;

include <Riemann3d.scad>;
