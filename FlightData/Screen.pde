ArrayList <Widget> myWidgetList;

class Screen
{
  ArrayList <Widget> myWidgetList;
  color bgColor, widgetColor, labelColor;
  String label;
  int event;
  int xPos;
  int yPos;
  boolean hasGraph;
HashMap<String, Integer> freqMap;

  Screen(color bgColor, boolean graph, HashMap freqMap)
  {
    this.bgColor = bgColor;
    myWidgetList = new ArrayList();
    xPos = 0;
    yPos = 0;
    this.hasGraph = graph;
    this.freqMap = freqMap;
  }

  void addWidget(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event) {
    myWidgetList.add(new Widget(x, y, width, height,
      label, widgetColor, widgetFont, event));
  }

  void drawScreen() //<>//
  {
    // drawing the widgetts
    fill(bgColor);
    rect(xPos, yPos, width, height);
    for (Widget theWidget : myWidgetList)
    {
      theWidget.drawWidget();
    }
    if (hasGraph)
    {
      barChart flChart = new barChart(freqMap);
      flChart.drawChart();
    }
  }
}
