import processing.sound.*;

PImage woman, skirt, shirt, bra, panties, shoe1, shoe2;
boolean shirt_on;
boolean skirt_on;
boolean shoe1_on;
boolean shoe2_on;
boolean bra_on;
boolean panties_on;
SoundFile zene; //zene típus.
boolean zene_on; // azért h ne induljon mindíg újra


void setup() {
  size(600, 495);
  woman = loadImage("fekvo no2.jpg");
  bra = loadImage("bra.png");
  panties = loadImage("panties.png");
  skirt = loadImage("skirt.png");
  shirt = loadImage("shirt.png");
  shoe1 = loadImage("shoe1.png");
  shoe2 = loadImage("shoe2.png");
  background(woman);
  shirt_on = true;
  skirt_on = true;
  shoe1_on = true;
  shoe2_on = true;
  bra_on = true;
  panties_on = true;
 //   file = new SoundFile(this, "probazene.mp3");
  zene = new SoundFile(this, "processing_zene.mp3"); //zene cucc
  zene_on=false; // ez is.
}

void draw() {
  
  //+++++++++++++++++++++++++++++++ innentől a zene
  if ((mouseX > 5) && (mouseX<width-5) && (mouseY>5) && (mouseY<height-5))
  {
    if (!zene_on){
    zene_on=true;
    zene.play();
    }
  }
  else
  {
     zene_on=false;
     zene.stop();
  }
  
  //----------------------------------------- idáig
  background(woman);
  if (bra_on) {
    image(bra, 0, 0);
  }
  if (panties_on) {
    image(panties, 0, 0);
  }
  if (skirt_on) {
    image(skirt, 0, 0);
  }
  if (shirt_on) {
    image(shirt, 0, 0);
  }
  if (shoe1_on) {
    image(shoe1, 0, 0);
  }
  if (shoe2_on) {
    image(shoe2, 0, 0);
  }

  /*if ((mousePressed)&&(abs(365-mouseX)<50)&&(abs(255-mouseY)<50)) {
   skirt_on = false;
   
   }*/

  if ((mousePressed)&&(abs(365-mouseX)<50)&&(abs(255-mouseY)<50)&&(skirt_on == false)) {
    panties_on = false;
  }

  /*if ((mousePressed)&&(abs(215-mouseX)<50)&&(abs(255-mouseY)<50)) {
    shirt_on = false;
  }*/

  if ((mousePressed)&&(abs(215-mouseX)<50)&&(abs(255-mouseY)<50)&&(shirt_on==false)) {
    bra_on = false;
  }

  if ((mousePressed)&&(abs(530-mouseX)<25)&&(abs(255-mouseY)<25)) {
    shoe1_on = false;
  }


  if ((mousePressed)&&(abs(400-mouseX)<25)&&(abs(150-mouseY)<25)) {
    shoe2_on = false;
  }
}

void mouseClicked() {
  if ((abs(365-mouseX)<50)&&(abs(255-mouseY)<50)) {
    skirt_on = false;
  }
  if ((abs(215-mouseX)<50)&&(abs(255-mouseY)<50)) {
    shirt_on = false;
  }
}