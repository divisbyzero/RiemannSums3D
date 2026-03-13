//===================================================
// A function with both partial derivatives equal to zero at the origin, but not differentiable there.
// Main entry file with all user-editable parameters.
//===================================================

/* [Function Parameters] */

// f(x, y) = xy/(x^2 + y^2), with f(0,0) defined as 0.
function f(x, y) = (x == 0 && y == 0)
    ? 0.5
    : x*y / (x*x + y*y);

/* [Display] */

// true = Riemann sum prisms, false = smooth function surface
render_riemann = false;

/* [Scaling] */

// Final model width in mm (x direction); height and depth scale proportionally
targetxwidth = 80;
// Exaggerates vertical features
verticalscalefactor = 0.5;
// Shifts surface upward to ensure positive heights
verticaltranslation = 20;

/* [Domain] */

// Minimum x value
xmin = -1;
// Maximum x value
xmax = 1;
// Minimum y value
ymin = -1;
// Maximum y value
ymax = 1;

/* [Subdivisions] */

// Number of subdivisions in x (higher = finer resolution)
nx = 29;
// Number of subdivisions in y
ny = 29;
// Smooth-mode subdivisions in x (used only when render_riemann = false)
smooth_nx = 300;
// Smooth-mode subdivisions in y (used only when render_riemann = false)
smooth_ny = 300;

include <Riemann3d.scad>;
