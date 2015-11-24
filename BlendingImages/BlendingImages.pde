//images
PImage yee;
PImage text;

PImage jon;

//position always moving toward the mouse cursor for yee to be blended at
float x, y;

//resizable dynamic arrays 
ArrayList<PVector> jon_pos;
ArrayList<PVector> jon_vel;

void setup(){
  //set the window size, create empty arrays
  size(480, 360);
  
  jon_pos = new ArrayList();
  jon_vel = new ArrayList();
  
  //load images and blend yee with text
  yee  = loadImage("yee.jpg"); 
  text = loadImage("text.jpg"); 
  
  yee.blend(text, 0, 0, yee.width, yee.height, 0, 0, text.width, text.height, EXCLUSION);
  
  jon = loadImage("jon.png");
  
  //set the 
  x = 0;
  y = 0;
}

void draw(){
  //reblend the yee and text with the now position for text
  yee  = loadImage("yee.jpg"); 
  yee.blend(text, 0, 0, text.width, text.height, (int)x-text.width/2, (int)y-text.height/2, text.width, text.height, EXCLUSION);
  
  //draw the blended yee
  image(yee, 0, 0);
  
  //move x toward mouseX and y toward mouseY
  if(x != mouseX){
    x -= (x - mouseX)*0.1;
  }
  if(y != mouseY){
    y -= (y - mouseY)*0.1;
  }
  
  //if the mouse is clicked, add another position at the mouse cursor and random velocity for jon to be drawn with
  if(mousePressed){
    jon_pos.add(new PVector(mouseX, mouseY));
    jon_vel.add(new PVector(random(-5, 5), random(-20, 0))); 
  }
  
  //loop through all of the jon positions
  for(int i = 0; i < jon_pos.size(); i++){
    //add the respective velocity to the position
    jon_pos.get(i).add(jon_vel.get(i));
    
    //accelerate the y velocity for gravity
    jon_vel.get(i).y += 0.98;
    
    //draw jon centered at the jon position
    image(jon, jon_pos.get(i).x - jon.width/2, jon_pos.get(i).y - jon.height/2); //<>//
  }  
}