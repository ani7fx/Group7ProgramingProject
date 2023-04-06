//final int EVENT_BUTTON1=1;
//final int EVENT_BUTTON2=2;
//final int EVENT_BUTTON3=3;
//final int EVENT_BUTTON4=4;
//final int EVENT_NULL=0;
//final int WIDGET_WIDTH = 200;
//final int WIDGET_HEIGHT = 80;

//class Widget {
//  int widgetX, widgetY, width, height;
//  String label;
//  int event;
//  color widgetColor, labelColor, strokeColor;
//  PFont widgetFont;

//  Widget(int widgetX,int widgetY, int width, int height, String label,
//  color widgetColor, PFont widgetFont, int event){
//    this.widgetX=widgetX; this.widgetY=widgetY; this.width = width; this.height= height;
//    this.label=label; this.event=event; 
//    this.widgetColor=widgetColor; this.widgetFont=widgetFont; strokeColor = color(0);
//    labelColor= color(0);
//   }
//  void drawWidget(){ //<>//
//    stroke(strokeColor);
//    fill(widgetColor);
//    rect(widgetX,widgetY,width,height);
//    fill(labelColor);
//    text(label, widgetX+5, widgetY+height-27);
//    textSize(22);
//  }
//  int getEvent(int mX, int mY){
//     if(mX>widgetX && mX < widgetX+width && mY >widgetY && mY <widgetY+height)
//     {
//        return event;
//     }
//     else
//     {
//       return EVENT_NULL;
//     }
//  }
//}
