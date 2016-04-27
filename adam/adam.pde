PImage hatter;
boolean is_on;
float x, y;


void setup() {
  size(383, 600);
  hatter = loadImage("adam2.jpg");
  background(hatter);
  is_on=true;
  x=width/2;
  y=340;
}

void draw() {   
  background(hatter);
  if (is_on) {
    ellipse(x, y, 30, 30);
  }
  if ((mousePressed)&&(abs(x-mouseX)<15)&&(abs(y-mouseY)<15)) {
    is_on=false;
  }
}