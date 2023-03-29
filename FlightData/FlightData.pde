import java.util.Scanner; //<>//
Table theTable;
ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
PFont standard;
//int x = 30;

Screen screen1;
Screen screen2;
Screen currentScreen;
HashMap<String, Integer> freqMap = new HashMap<String, Integer>();
ArrayList <String> floridaAirports = new ArrayList<String>();

//PImage image;
//ScreenButton[] buttons = new ScreenButton[51];
//int screen = 1;


void setup() {

  theTable = loadTable("flights2k.csv", "header");
  initFlights();


  screen1 = new Screen(150, false, freqMap);
  screen1.addWidget((width/2)-WIDGET_WIDTH/2, (height/2), WIDGET_WIDTH, WIDGET_HEIGHT, "Flights from florida", color(255, 0, 0),
    standard, EVENT_BUTTON1);
  screen2 = new Screen(80, true, freqMap);
  screen2.addWidget((width/2)-WIDGET_WIDTH/2, (height/2), WIDGET_WIDTH, WIDGET_HEIGHT, "Go back", color(0, 0, 255),
    standard, EVENT_BUTTON3);

  currentScreen = screen1;
  standard =loadFont("AppleSDGothicNeo-UltraLight-20.vlw");
  textFont(standard);
  size(1000, 1000);
  background(#FCFCFC);
  countCitiesInState();
  
  
  //image = loadImage("usstatesbc__90159.jpg");
  //buttons[0] = new ScreenButton( 250, 39, 84, 55); //alabama 
  //buttons[1] = new ScreenButton(250, 110, 84, 55); //goes down to virginia
  //buttons[2] = new ScreenButton(250, 182, 84, 55);
  //buttons[3] = new ScreenButton(250, 253, 84, 55);
  //buttons[4] = new ScreenButton(250, 327, 84, 55);
  //buttons[5] = new ScreenButton(250, 402, 84, 55);
  //buttons[6] = new ScreenButton(250, 477, 84, 55);
  //buttons[7] = new ScreenButton(250, 553, 84, 55);
  //buttons[8] = new ScreenButton(250, 620, 84, 55);
  //buttons[9] = new ScreenButton(250, 700, 84, 55);  //virginia
  //buttons[10] = new ScreenButton(350, 39, 84, 55); //2nd row 
  //buttons[11] = new ScreenButton(350, 110, 84, 55); 
  //buttons[12] = new ScreenButton(350, 182, 84, 55); 
  //buttons[13] = new ScreenButton(350, 253, 84, 55); 
  //buttons[14] = new ScreenButton(350, 327, 84, 55); 
  //buttons[15] = new ScreenButton(350, 402, 84, 55); 
  //buttons[16] = new ScreenButton(350, 477, 84, 55); 
  //buttons[17] = new ScreenButton(350, 553, 84, 55); 
  //buttons[18] = new ScreenButton(350, 620, 84, 55); 
  //buttons[19] = new ScreenButton(350, 700, 84, 55); //washington
  //buttons[20] = new ScreenButton(452, 39, 84, 55);  //3rd column
  //buttons[21] = new ScreenButton(452, 110, 84, 55);
  //buttons[22] = new ScreenButton(452, 182, 84, 55);
  //buttons[23] = new ScreenButton(452, 253, 84, 55);
  //buttons[24] = new ScreenButton(452, 327, 84, 55);
  //buttons[25] = new ScreenButton(452, 402, 84, 55);
  //buttons[26] = new ScreenButton(452, 477, 84, 55);
  //buttons[27] = new ScreenButton(452, 553, 84, 55);
  //buttons[28] = new ScreenButton(452, 620, 84, 55);
  //buttons[29] = new ScreenButton(452, 700, 84, 55);  //west virginia
  //buttons[30] = new ScreenButton(553, 39, 84, 55);   // 4th column
  //buttons[31] = new ScreenButton(553, 110, 84, 55);
  //buttons[32] = new ScreenButton(553, 182, 84, 55);
  //buttons[33] = new ScreenButton(553, 253, 84, 55);
  //buttons[34] = new ScreenButton(553, 327, 84, 55);
  //buttons[35] = new ScreenButton(553, 402, 84, 55);
  //buttons[36] = new ScreenButton(553, 477, 84, 55);
  //buttons[37] = new ScreenButton(553, 553, 84, 55);
  //buttons[38] = new ScreenButton(553, 620, 84, 55);
  //buttons[39] = new ScreenButton(553, 700, 84, 55);  // wisconsin
  //buttons[40] = new ScreenButton(653, 39, 84, 55);  // 5th column
  //buttons[41] = new ScreenButton(653, 110, 84, 55);
  //buttons[42] = new ScreenButton(653, 182, 84, 55);
  //buttons[43] = new ScreenButton(653, 253, 84, 55);
  //buttons[44] = new ScreenButton(653, 327, 84, 55);
  //buttons[45] = new ScreenButton(653, 402, 84, 55);
  //buttons[46] = new ScreenButton(653, 477, 84, 55);
  //buttons[47] = new ScreenButton(653, 553, 84, 55);
  //buttons[48] = new ScreenButton(653, 620, 84, 55);
  //buttons[49] = new ScreenButton(653, 700, 84, 55);
  
  //buttons[50] = new ScreenButton(110, 39, 84, 55);  // button screen 2
  
  
  
  
}

void initFlights() {
  int rowCount = theTable.getRowCount(); //<>//
  for (int i = 0; i < rowCount; i++)
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

void countCitiesInState() { //<>//
  for (int i = 0; i < flightsArray.size(); i++)
  {
    if (flightsArray.get(i).originState.equals("FL"))
    {
      floridaAirports.add(flightsArray.get(i).origin);
    }
  }

  for (String city : floridaAirports) {
    if (freqMap.containsKey(city)) {
      freqMap.put(city, freqMap.get(city) + 1);
    } else
    {
      freqMap.put(city, 1);
    }
  }

  for (String key : freqMap.keySet())
  {
    int frequency = freqMap.get(key);
    System.out.println(key + ": " + frequency);
  }
}
void draw()
{
  //for (int i = 0; i < flightsArray.size(); i++)
  //{
  if (currentScreen == screen1)
  {
    screen1.drawScreen();
  } else if (currentScreen == screen2)
  {
    screen2.drawScreen();
  }
  /*

   {
   
   fill(0);
   text(i + " " + flightsArray.get(i).flightDate + " " + flightsArray.get(i).mktCarrier + " " + flightsArray.get(i).flightNum + " " +flightsArray.get(i).origin + " " +flightsArray.get(i).originCity + " " +flightsArray.get(i).originState +" " +
   flightsArray.get(i).originWAC + " " +flightsArray.get(i).dest + " " +flightsArray.get(i).destCity + " " +flightsArray.get(i).destState + " " +flightsArray.get(i).destWAC + " " +flightsArray.get(i).crsDepTime + " " +
   flightsArray.get(i).depTime + " " +flightsArray.get(i).crsArrTime +" " + flightsArray.get(i).arrTime + " " +flightsArray.get(i).cancelled + " " +flightsArray.get(i).diverted + " " +flightsArray.get(i).distance, 10, x);
   x = x+30;
   
   */
  //}
  
  
  //if (screen == 1) {
  //  for (int i = 0; i < 50; i++) {
  //    noStroke();
  //    buttons[i].display();
  //  }
  //  // Display first screen
  //  float imageWidth = image.width * 0.6; // Reduce the width of the image to be 50% of its original size
  //  float imageHeight = image.height * 0.6; // Reduce the height of the image to be 50% of its original size
  //  float x = (width-imageWidth)/2; // Calculate the x position to center the image
  //  float y = height * 0.01 ; // Set the y position to be 10% from the top of the screen
  //  background(255);
  //  image(image, x, y, imageWidth, imageHeight);
    
  //} else if (screen == 2) {
  //  // Display second screen
  //  background(#65C2DE);
  //  stroke(#050505);
  //  fill(#F784E2);
  //  buttons[50].display();
  //}
}

void mousePressed()
{
  if (currentScreen == screen1)
  {
    for (int i = 0; i < screen1.myWidgetList.size(); i++)
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
  } else
  {
    for (int i = 0; i < screen2.myWidgetList.size(); i++)
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
  } else
  {
    currentScreen = screen1;
  }
}




//void mousePressed() {
//  for (int i = 0; i < buttons.length; i++) {
//    if (buttons[i].isMouseOver()) {
//      if (i == 50) {
//        screen = 1; // Go back to screen 1
//      } else {
//        screen = 2; // Go to screen 2
//      }
//      break;
//    }
//  }
//}
