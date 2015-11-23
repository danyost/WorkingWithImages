PImage image;

void setup(){
 image = loadImage("doge.jpg"); 
 size(1000, 1000);
 frameRate(1000);
}

void draw(){
  for(int i = 0; i < 32; i++){
    int x = (int)random(width);
    int y = (int)random(height);
    
    noStroke();
    fill(image.get(x, y));
    
    ellipse(x, y, 10, 10);
  }
}