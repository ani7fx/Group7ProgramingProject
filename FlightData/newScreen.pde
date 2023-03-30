import controlP5.*;

ControlP5 cp5;

int myColor = color(255);

int c1,c2;

float n,n1;

void drawButtons() 
{
  cp5.addButton("Flights from Florida")
     .setValue(0)
     .setPosition(width/2-150,height/2)
     .setSize(300,38)
     .setCaptionLabel("ur mom");
     
   
}
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  switchScreen();
  
  n = 0;
}
public void colorA(int theValue) {
  println("a button event from colorA: "+theValue);
  c1 = c2;
  c2 = color(0,160,100);
}
