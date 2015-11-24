PImage yee;
PImage text;

int mode = 0;

void setup(){
  size(480, 360);
  
  yee  = loadImage("yee.jpg"); 
  text = loadImage("text.jpg"); 
  
  yee.blend(text, 0, 0, yee.width, yee.height, 0, 0, text.width, text.height, EXCLUSION);
}

void draw(){
  
  image(yee, 0, 0);
}