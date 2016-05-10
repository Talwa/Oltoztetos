import processing.sound.*;

PImage woman, dress, bra, panties, shoe1, shoe2;
boolean dress_on;
boolean shoe1_on;
boolean shoe2_on;
boolean bra_on;
boolean panties_on;
SoundFile zene;
boolean zene_on;

void setup() {
  size(500,600);
  woman = loadImage("furdo no.jpg");
  bra = loadImage("bra.png");
  panties = loadImage("panties.png");
  dress = loadImage("dress.png");
  shoe1 = loadImage("shoe1.png");
  shoe2 = loadImage("shoe2.png");
  background(woman);
  dress_on = true;
  shoe1_on = true;
  shoe2_on = true;
  bra_on = true;
  panties_on = true;
  zene = new SoundFile(this, "processing_zene.mp3");
  zene_on=false; 
}

void draw() {
  
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
  
  background(woman);
  if (bra_on) {
    image(bra, 0, 0);
  }
  if (panties_on) {
    image(panties, 0, 0);
  }
  if (dress_on) {
    image(dress, 0, 0);
  }
  
 if (shoe1_on) {
    image(shoe1, 0, 0);
  }
  if (shoe2_on) {
    image(shoe2, 0, 0);
  }

  if ((mousePressed)&&(abs(190-mouseX)<50)&&(abs(290-mouseY)<50)&&(dress_on == false)) {
    panties_on = false;
  }

  if ((mousePressed)&&(abs(190-mouseX)<50)&&(abs(183-mouseY)<50)&&(dress_on == false)) {
    bra_on = false;
  }

  if ((mousePressed)&&(abs(287-mouseX)<60)&&(abs(563-mouseY)<60)) {
    shoe1_on = false;
  }


  if ((mousePressed)&&(abs(182-mouseX)<60)&&(abs(563-mouseY)<60)) {
    shoe2_on = false;
  }
}

void mouseClicked() {
  if ((abs(190-mouseX)<50)&&(abs(235-mouseY)<100)) {
    dress_on = false;
  }
}