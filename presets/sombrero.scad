// Sombrero preset
// Contains function, domain, and vertical scaling parameters.

k = 0.18;  // [0.01:0.01:1]
function f(x, y) = exp(-k * sqrt(x*x + y*y)) * cos(sqrt(x*x + y*y) * (180 / PI));

xmin = -4*PI;
xmax = 4*PI;
ymin = -4*PI;
ymax = 4*PI;

verticalscalefactor = 2.0;  // [0.1:0.1:10]
verticaltranslation = 8;    // [0:0.5:60]
