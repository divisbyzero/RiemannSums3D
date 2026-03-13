//===================================================
// Monkey Saddle: Riemann Sum Model
// Main entry file with all user-editable parameters.
//===================================================

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

// Included for consistency across function files; not used by monkey saddle.
k = 0.18;

function f(x, y) = x*x*x - 3*x*y*y;

include <Riemann3d.scad>;
