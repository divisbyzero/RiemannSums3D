//===================================================
// 3D Riemann Sum for functions of two variables
// Solid model for sombrero function (scaled and printable)
//===================================================

//----------------------------
// User Parameters and Function
//----------------------------

//monkey saddle use [-2.5,2.5]x[-2.5,2.5]
function f(x, y) = x*x*x - 3*x*y*y; 

// Sombrero function in polar form: f(r) = e^{-k * r} * cos(r)
//k = 0.18;
//function f(x, y) = exp(-k * sqrt(x*x + y*y)) * cos(sqrt(x*x + y*y) * (180 / PI));
//use [-4*Pi,4*PI] x [-4*Pi,4*PI]

// Domain for x and y 
xmin = -2.5;
xmax =  2.5;
ymin = -2.5;
ymax =  2.5;

// Subdivisions
nx = 29;
ny = 29;

// Final print target width (in mm)
targetxwidth = 80;

// Vertical shaping parameters
verticalscalefactor = .04;    // exaggerate vertical scale
verticaltranslation = 20;    // shift entire object upward (in mm)

//----------------------------
// Derived Scaling Parameters
//----------------------------

domain_width = xmax - xmin;
domain_depth = ymax - ymin;
aspect_ratio = domain_depth / domain_width;

targetywidth = targetxwidth * aspect_ratio;

xscale = targetxwidth / domain_width;
yscale = targetywidth / domain_depth;
zscale = xscale;  // maintain proportional 3D scaling

dx_math = domain_width / nx;
dy_math = domain_depth / ny;

dx_phys = dx_math * xscale;
dy_phys = dy_math * yscale;

// Final scaled function: apply vertical scale and translation after all other scaling
function g(x, y) = zscale * (verticalscalefactor * f(x, y)) + verticaltranslation;

//----------------------------
// Prism Generator
//----------------------------
module riemann_prism(i, j) {
    x0 = xmin + i * dx_math;
    y0 = ymin + j * dy_math;
    z = g(x0 + dx_math/2, y0 + dy_math/2);

    translate([0, 0, 0])
        cube([dx_phys, dy_phys, z], center = false);
}

//----------------------------
// Surface Assembly
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
// Final Model (Wrapped in union() for valid STL)
//----------------------------
module final_model() {
    union() {
        // Thin invisible floor to ensure watertightness
        cube([targetxwidth, targetywidth, 0.5], center = false);
        riemann_surface();
    }
}

color("orange")
render() final_model();


