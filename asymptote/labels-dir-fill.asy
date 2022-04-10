size(80mm);

draw(unitcircle);
draw((0,0)--(1,0));
/* pre-determined direction 'E' */
label("$0^\circ$", (1,0), E);
draw((0,0)--dir(30));
/* label the origin, shift far to direction of 30deg */
label("$30^\circ$", (0,0), 32*dir(30));
draw((0,0)--dir(150));
/* label the 150deg point, shift to the opposite direction
   fill background white to cover the spike */
label("$150^\circ$", dir(150), -dir(150),
      Fill(white));

