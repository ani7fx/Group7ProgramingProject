final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_BUTTON4=4;
final int EVENT_NULL=0;
final int WIDGET_WIDTH = 200;
final int WIDGET_HEIGHT = 80;

class Widget {
  int x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor, strokeColor;
  PFont widgetFont;

  Widget(int x,int y, int width, int height, String label,
  color widgetColor, PFont widgetFont, int event){
    this.x=x; this.y=y; this.width = width; this.height= height;
    this.label=label; this.event=event; 
    this.widgetColor=widgetColor; this.widgetFont=widgetFont; strokeColor = color(0);
    labelColor= color(0);
   }
  void draw(){
    stroke(strokeColor);
    fill(widgetColor);
    rect(x,y,width,height);
    fill(labelColor);
    text(label, x+5, y+height-27);
    textSize(26);
  }
  int getEvent(int mX, int mY){
     if(mX>x && mX < x+width && mY >y && mY <y+height)
     {
        return event;
     }
     else
     {
       return EVENT_NULL;
     }
  }
}
