import processing.sound.*;

PImage hatter;
float x, y;
Ruha[] ruhak = new Ruha[8];
SoundFile zene; //zene típus.
boolean zene_on; // azért h ne induljon mindíg újra

class Ruha {
  boolean is_on;
  boolean is_ok;
  float x, y, z, q;
  PImage kep;

  void make(float a, float b, float c, float d, boolean e, PImage f) {
    is_on=true;
    is_ok=e;
    x=a;
    y=b;
    z=c;
    q=d;
    kep=f;
  }


  void on() {
    if (is_on) {
      image(kep, 0, 0);
    /*if (is_ok)
      { 
        fill(255, 40, 40);
      } else
      { 
        fill (180, 40, 40);
      }
      rect(x, z, y-x, q-z);
    */
    }
  }
}


void setup() {
  size(383, 600);
  hatter = loadImage("adam2.jpg");
  background(hatter);


  zene = new SoundFile(this, "processing_zene.mp3"); //zene cucc
  zene_on=false; // ez is.

  for (int i=0; i<8; i++)
  {
    ruhak[i]=new Ruha();
  }

  ruhak[0].make(135, 240, 310, 375, false, loadImage("boxers.png"));
  ruhak[1].make(240, 275, 505, 575, false, loadImage("sock1.png"));
  ruhak[2].make(140, 180, 525, 590, false, loadImage("sock2.png"));
  ruhak[3].make(235, 275, 525, 585, true, loadImage("shoe1.png"));
  ruhak[4].make(130, 190, 540, 595, true, loadImage("shoe2.png"));
  ruhak[5].make(135, 245, 310, 440, false, loadImage("trousers.png"));
  ruhak[6].make(150, 240, 175, 300, true, loadImage("shirt.png"));
  ruhak[7].make(140,240, 310, 325, true, loadImage("belt.png"));
}

void draw() {   
  background(hatter);
  for (int i=0; i<8; i++) {
    ruhak[i].on();
  }
  zene();
}

void mouseClicked() {
  for (int i=0; i<8; i++)
  { 
    if ((ruhak[i].is_on) && (ruhak[i].is_ok) && (mouseX>ruhak[i].x) && (mouseX<ruhak[i].y) && (mouseY>ruhak[i].z) && (mouseY<ruhak[i].q))
    {
      ruhak[i].is_on=false;
      for (int j=0; j<8; j++)
      {
       if (!ruhak[j].is_ok)
        {
          if(((i==7)&&(j==5))||((i==5)&&(j==0))||((i==3)&&(j==1))||((i==4)&&(j==2)))
          {
            ruhak[j].is_ok=true;
          }
        }
      }
    }
  }
}

void zene()
{
  if ((mouseX > 5) && (mouseX<width-5) && (mouseY>5) && (mouseY<height-5))
  {
    if (!zene_on) {
      zene_on=true;
      zene.play();
    }
  } else
  {
    zene_on=false;
    zene.stop();
  }
}