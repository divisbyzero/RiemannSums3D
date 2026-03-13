// Sombrero
// f(x, y) = exp(-k * r) * cos(r),  r = sqrt(x^2 + y^2)
//
// Suggested parameter values:
//   xmin = -12.57, xmax = 12.57, ymin = -12.57, ymax = 12.57
//   verticalscalefactor = 2.0, verticaltranslation = 8
//   k = 0.18

function f(x, y) = exp(-k * sqrt(x*x + y*y)) * cos(sqrt(x*x + y*y) * (180 / PI));
