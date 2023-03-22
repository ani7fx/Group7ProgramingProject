
import java.util.Scanner;
Table theTable;
ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
PFont standard;
int x = 30;
Screen screen1;
Screen screen2;
Screen currentScreen;

void setup() {
  
  theTable = loadTable("flights2k.csv", "header");
  initFlights();
  
  screen1 = new Screen(150,false);
  screen1.addWidget((width/2)-WIDGET_WIDTH/2, (height/2), 100, 40, "Flights from florida", color(255,0, 0),
                    standard, EVENT_BUTTON1);
  screen2 = new Screen(80,true);
  screen2.addWidget((width/2)-WIDGET_WIDTH/2, (height/2), 100, 40, "Go back", color(0,0, 255),
                    standard, EVENT_BUTTON3);
                    
  currentScreen = screen1;
  standard =loadFont("AppleSDGothicNeo-UltraLight-20.vlw");  
  textFont(standard);
  size(900,900);
  background(#FCFCFC);
   
}

void initFlights() {
  int rowCount = theTable.getRowCount();
  for (int i = 0; i < rowCount ; i++)
  {
    TableRow row = theTable.getRow(i);
    flightsArray.add(new DataPoint(row));
    /*
    println(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " +flightsArray.get(i).origin + " " +flightsArray.get(i).originCity + " " +flightsArray.get(i).originState +" " +
    flightsArray.get(i).originWAC + " " +flightsArray.get(i).dest + " " +flightsArray.get(i).destCity + " " +flightsArray.get(i).destState + " " +flightsArray.get(i).destWAC + " " +flightsArray.get(i).crsDepTime + " " +
    flightsArray.get(i).depTime + " " +flightsArray.get(i).crsArrTime +" " + flightsArray.get(i).arrTime + " " +flightsArray.get(i).cancelled + " " +flightsArray.get(i).diverted + " " +flightsArray.get(i).distance);
    */
  }
}
void draw() {
  for (int i = 0; i < flightsArray.size(); i++)
  { 
    if(currentScreen == screen1)
    {
      screen1.draw();
    }
    else if (currentScreen == screen2)
    {
      screen2.draw();
    }
    /*
    fill(0);
    text(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " +flightsArray.get(i).origin + " " +flightsArray.get(i).originCity + " " +flightsArray.get(i).originState +" " +
    flightsArray.get(i).originWAC + " " +flightsArray.get(i).dest + " " +flightsArray.get(i).destCity + " " +flightsArray.get(i).destState + " " +flightsArray.get(i).destWAC + " " +flightsArray.get(i).crsDepTime + " " +
    flightsArray.get(i).depTime + " " +flightsArray.get(i).crsArrTime +" " + flightsArray.get(i).arrTime + " " +flightsArray.get(i).cancelled + " " +flightsArray.get(i).diverted + " " +flightsArray.get(i).distance, 10,x);
    x = x+30;
    */
  }  
}

void mousePressed()
{
  if(currentScreen == screen1)
  {
    for (int i = 0; i < screen1.myWidgetList.size() ; i++)
    {
       Widget aWidget = (Widget)screen1.myWidgetList.get(i);
       int event = aWidget.getEvent(mouseX, mouseY);
       switch (event)
       {
         case EVENT_BUTTON1:
           switchScreen();
           break;
       }
    }
  }
  else
  {
    for (int i = 0; i < screen2.myWidgetList.size() ; i++)
    {
       Widget aWidget = (Widget) screen2.myWidgetList.get(i);
       int event = aWidget.getEvent(mouseX, mouseY);
       switch (event)
       {
         case EVENT_BUTTON3:
           switchScreen();
           break;
       }
    }
  }
}

void switchScreen()
{
  if (currentScreen == screen1)
  {
    currentScreen = screen2;
  }
  else
  {
    currentScreen = screen1;
  }
}
