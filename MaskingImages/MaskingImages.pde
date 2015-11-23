PImage p_salad;
PImage ps_mask;

void setup(){
  p_salad = loadImage("potato_salad.jpg");
  ps_mask = loadImage("potato_mask.jpg");
  
  p_salad.mask(ps_mask);
  
  size(800, 450);
}

void draw(){
  background(random(255), random(255), random(255));
  image(p_salad, 0, 0); 
}