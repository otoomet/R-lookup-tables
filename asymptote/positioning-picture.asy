/* set the total size, for all pictures we do */
size(120mm);

/* Draw a diagonal line on the base pic */
draw((0,0)--(1,1));

/* Create a new picture, containing a circle */
picture p = new picture;
draw(p, scale(0.2)*unitcircle);

/* put the circle at the origin */
add(p);
/* put the circle again, shifted and scaled */
add(shift((1,1))*scale(2)*p);


