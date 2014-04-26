import java.awt.event.*;

PImage source;
PImage destination;

int threshold;

void setup(){
  size(262, 192);
  threshold = 0;
  source = loadImage("images.jpg");
  destination = createImage(width, height, RGB);
  addMouseWheelListener(new MouseWheelListener() { 
    public void mouseWheelMoved(MouseWheelEvent mwe) { 
      mouseWheel(mwe.getWheelRotation());
  }});
}

void draw(){
  source.loadPixels();
  destination.loadPixels();
  
  for(int i=0; i<source.height; ++i){
   for(int j=0; j<source.width; ++j){
    if(brightness(source.pixels[i*source.width + j]) > threshold){
      destination.pixels[i*destination.width + j] = color(255);
    }
    else{
      destination.pixels[i*destination.width + j] = color(0);
    }
   } 
  }
  
  destination.updatePixels();
  image(destination,0,0);
}

void mouseWheel(int delta){
 threshold += -delta;
 threshold = constrain(threshold, 0, 255); 
}
