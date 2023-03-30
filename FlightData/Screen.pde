//ArrayList <Widget> myWidgetList;

//class Screen
//{
//  ArrayList <Widget> myWidgetList;
//  color bgColor, widgetColor, labelColor;
//  String label;
//  int event;
//  int xPos;
//  int yPos;
//  boolean hasGraph;
//HashMap<String, Integer> freqMap;

//  Screen(color bgColor, boolean graph, HashMap freqMap)
//  {
//    this.bgColor = bgColor;
//    myWidgetList = new ArrayList();
//    xPos = 0;
//    yPos = 0;
//    this.hasGraph = graph;
//    this.freqMap = freqMap;
//  }

//  void addWidget(int x, int y, int width, int height, String label,
//    color widgetColor, PFont widgetFont, int event) {
//    myWidgetList.add(new Widget(x, y, width, height,
//      label, widgetColor, widgetFont, event));
//  }

//  void drawScreen() //<>//
//  {
//    // drawing the widgetts
//    fill(bgColor);
//    rect(xPos, yPos, width, height);
//    for (Widget theWidget : myWidgetList)
//    {
//      theWidget.drawWidget();
//    }
//    if (hasGraph)
//    {
//      barChart flChart = new barChart(freqMap);
//      flChart.drawChart();
//    }
//if (dateScreen)
//    {
//      text("Enter your start date and end date in the format mm/dd/yyyy - mm/dd/yyyy", 50, 100);
//      fill(255);
//      rect(50, 120, 250, 30);
//      fill(0);
//      input = input (50, 150);
//      betweenDates = betweenDates(input, flightsArray);
//      if (betweenDates.size() != 0)
//      {
//        text("Your date range has " + (betweenDates.size()+1) + " flights in it.", 50, 250);
//        for (int i = 0; i < betweenDates.size(); i++ )
//          text(i + " " + betweenDates.get(i).flightDate + " " + betweenDates.get(i).mktCarrier + " " + betweenDates.get(i).flightNum + " " +betweenDates.get(i).origin + " " +betweenDates.get(i).originCity + " " +betweenDates.get(i).originState +" " +
//            betweenDates.get(i).originWAC + " " +betweenDates.get(i).dest + " " +betweenDates.get(i).destCity + " " +betweenDates.get(i).destState + " " +betweenDates.get(i).destWAC + " " +betweenDates.get(i).crsDepTime + " " +
//            betweenDates.get(i).depTime + " " +betweenDates.get(i).crsArrTime +" " + betweenDates.get(i).arrTime + " " +betweenDates.get(i).cancelled + " " +betweenDates.get(i).diverted + " " +betweenDates.get(i).distance, 50, y);
//            y = y+30;
//      }
//  }
//}
