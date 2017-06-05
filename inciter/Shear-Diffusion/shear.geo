// Gsmh geometry definition for a simple 3d box domain

// Dimensions
xsize = 15.0;   // size of the domain in x
ysize = 5.0;    // size of the domain in y
zsize = 5.0;	// size of the domain in z
cl = 0.5;	// average mesh cell characteristic length

// Points
Point(1) = {    -xsize/2,    -ysize/2,    -zsize/2,  cl};
Point(2) = {     xsize/2,    -ysize/2,    -zsize/2,  cl};
Point(3) = {     xsize/2,     ysize/2,    -zsize/2,  cl};
Point(4) = {    -xsize/2,     ysize/2,    -zsize/2,  cl};
Point(5) = {    -xsize/2,    -ysize/2,    zsize/2,   cl};
Point(6) = {     xsize/2,    -ysize/2,    zsize/2,   cl};
Point(7) = {     xsize/2,     ysize/2,    zsize/2,   cl};
Point(8) = {    -xsize/2,     ysize/2,    zsize/2,   cl};

// Lines
Line( 1) = {1,2};
Line( 2) = {2,3};
Line( 3) = {3,4};
Line( 4) = {4,1};
Line( 5) = {5,6};
Line( 6) = {6,7};
Line( 7) = {7,8};
Line( 8) = {8,5};
Line( 9) = {1,5};
Line(10) = {2,6};
Line(11) = {3,7};
Line(12) = {4,8};

// Line-loops
Line Loop(1) = {-4,-3,-2,-1};
Line Loop(2) = {5,6,7,8};
Line Loop(3) = {1,10,-5,-9};
Line Loop(4) = {2,11,-6,-10};
Line Loop(5) = {3,12,-7,-11};
Line Loop(6) = {4,9,-8,-12};

// Surfaces
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};

// Surface loops
Surface Loop(1) = {1,2,3,4,5,6};

// Volumes
Volume(1) = {1};
