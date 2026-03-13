//===================================================
// Sombrero: Riemann Sum Model
// Main entry file with all user-editable parameters.
//===================================================

/* [Domain] */

// Minimum x value
xmin = -4*PI;
// Maximum x value
xmax = 4*PI;
// Minimum y value
ymin = -4*PI;
// Maximum y value
ymax = 4*PI;

/* [Subdivisions] */

// Number of subdivisions in x (higher = finer resolution)
nx = 29;
// Number of subdivisions in y
ny = 29;

/* [Scaling] */

// Final model width in mm (x direction); height and depth scale proportionally
targetxwidth = 80;
// Exaggerates vertical features
verticalscalefactor = 10.0;
// Shifts surface upward to ensure positive heights
verticaltranslation = 8;

/* [Function Parameters] */

// Decay constant for the sombrero profile.
k = 0.18;

function f(x, y) = exp(-k * sqrt(x*x + y*y)) * cos(sqrt(x*x + y*y) * (180 / PI));

include <Riemann3d.scad>;
