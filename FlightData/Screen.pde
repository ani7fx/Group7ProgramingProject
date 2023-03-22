ArrayList <Widget> myWidgetList;


class Screen {
ArrayList <Widget> myWidgetList;
color bgColor, widgetColor, labelColor;
String label;
int event;
int xPos;
int yPos;
boolean hasGraph;

Screen(color bgColor, boolean graph)
   {
      this.bgColor = bgColor;
      myWidgetList = new ArrayList();
      xPos = 0;
      yPos = 0;
      this.hasGraph = graph;
   }
   
   void addWidget(int x,int y, int width, int height, String label, 
                  color widgetColor, PFont widgetFont, int event){
     myWidgetList.add(new Widget(x,y,WIDGET_WIDTH,WIDGET_HEIGHT,
                                 label, widgetColor, widgetFont, event));
   }
   
   void draw() {
     // drawing the widgetts
     fill(bgColor);
     rect(xPos, yPos, width,height);
     for(Widget theWidget : myWidgetList)
     {
       theWidget.draw();
     }
     if (hasGraph)
     {
       drawChart();
     }
   }
}
