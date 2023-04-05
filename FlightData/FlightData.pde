import controlP5.*;  //<>// //<>//
ControlP5 cp5;
barChart chart1;
int currentTab = 1;
Table theTable;
ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
PFont standard;
HashMap<String, Integer> freqMap = new HashMap<String, Integer>();
ArrayList <String> floridaAirports = new ArrayList<String>();
String input;
ArrayList<DataPoint> betweenDates;
int y1 = 30;
int cancelledFlights = 0;
int earlyFlights = 0;
int onTimeFlights = 0;
int delayedFlights = 0;
PieChart pieChart;
barChart flChart;
Tab flightTab, tab2, tab3, tab4;
int colors[] = {#FF3E3E, #FFF646, #54FF46, #46E5FF};
int timeArray[];

PImage image;
ScreenButton[] buttons = new ScreenButton[51];
int screen = 1;

int stateNumber;

void setup() {
  theTable = loadTable("flights2k.csv", "header");
  initFlights();
  size(1000, 1000);
  cp5 = new ControlP5(this);
  noStroke();
  rectMode(CENTER);
  addTabs();
  addButtons();
  standard =loadFont("ArialMT-20.vlw");
  textFont(standard);
  countCitiesInState();
  flChart = new barChart(freqMap);
  timeArray = sortOutPunctuality();
  pieChart = new PieChart(width/2.0, height/2.0);
  textSize(20);
  initStateButtons();
}

void initStateButtons()
{
  image = loadImage("usstatesbc__90159.jpg");
  buttons[0] = new ScreenButton( 250, 39, 84, 55,1); //alabama 
  buttons[1] = new ScreenButton(250, 110, 84, 55,2); //goes down to virginia
  buttons[2] = new ScreenButton(250, 182, 84, 55,3);
  buttons[3] = new ScreenButton(250, 253, 84, 55,4);
  buttons[4] = new ScreenButton(250, 327, 84, 55,5);
  buttons[5] = new ScreenButton(250, 402, 84, 55,6);
  buttons[6] = new ScreenButton(250, 477, 84, 55,7);
  buttons[7] = new ScreenButton(250, 553, 84, 55,8);
  buttons[8] = new ScreenButton(250, 620, 84, 55,9);
  buttons[9] = new ScreenButton(250, 700, 84, 55,10);  //virginia
  buttons[10] = new ScreenButton(350, 39, 84, 55,11); //2nd row 
  buttons[11] = new ScreenButton(350, 110, 84, 55,12); 
  buttons[12] = new ScreenButton(350, 182, 84, 55,13); 
  buttons[13] = new ScreenButton(350, 253, 84, 55,14); 
  buttons[14] = new ScreenButton(350, 327, 84, 55,15); 
  buttons[15] = new ScreenButton(350, 402, 84, 55,16); 
  buttons[16] = new ScreenButton(350, 477, 84, 55,17); 
  buttons[17] = new ScreenButton(350, 553, 84, 55,18); 
  buttons[18] = new ScreenButton(350, 620, 84, 55,19); 
  buttons[19] = new ScreenButton(350, 700, 84, 55,20); //washington
  buttons[20] = new ScreenButton(452, 39, 84, 55,21);  //3rd column
  buttons[21] = new ScreenButton(452, 110, 84, 55,22);
  buttons[22] = new ScreenButton(452, 182, 84, 55,23);
  buttons[23] = new ScreenButton(452, 253, 84, 55,24);
  buttons[24] = new ScreenButton(452, 327, 84, 55,25);
  buttons[25] = new ScreenButton(452, 402, 84, 55,26);
  buttons[26] = new ScreenButton(452, 477, 84, 55,27);
  buttons[27] = new ScreenButton(452, 553, 84, 55,28);
  buttons[28] = new ScreenButton(452, 620, 84, 55,29);
  buttons[29] = new ScreenButton(452, 700, 84, 55,30);  //west virginia
  buttons[30] = new ScreenButton(553, 39, 84, 55,31);   // 4th column
  buttons[31] = new ScreenButton(553, 110, 84, 55,32);
  buttons[32] = new ScreenButton(553, 182, 84, 55,33);
  buttons[33] = new ScreenButton(553, 253, 84, 55,34);
  buttons[34] = new ScreenButton(553, 327, 84, 55,35);
  buttons[35] = new ScreenButton(553, 402, 84, 55,36);
  buttons[36] = new ScreenButton(553, 477, 84, 55,37);
  buttons[37] = new ScreenButton(553, 553, 84, 55,38);
  buttons[38] = new ScreenButton(553, 620, 84, 55,39);
  buttons[39] = new ScreenButton(553, 700, 84, 55,40);  // wisconsin
  buttons[40] = new ScreenButton(653, 39, 84, 55,41);  // 5th column
  buttons[41] = new ScreenButton(653, 110, 84, 55,42);
  buttons[42] = new ScreenButton(653, 182, 84, 55,43);
  buttons[43] = new ScreenButton(653, 253, 84, 55,44);
  buttons[44] = new ScreenButton(653, 327, 84, 55,45);
  buttons[45] = new ScreenButton(653, 402, 84, 55,46);
  buttons[46] = new ScreenButton(653, 477, 84, 55,47);
  buttons[47] = new ScreenButton(653, 553, 84, 55,48);
  buttons[48] = new ScreenButton(653, 620, 84, 55,49);
  buttons[49] = new ScreenButton(653, 700, 84, 55,50);

  buttons[50] = new ScreenButton(110, 39, 84, 55,51);  // button screen 2
}

void draw()
{
  background(100, 160, 100);
  displayTabs();
}

void addTabs()
{
  flightTab = cp5.addTab("Flights from Florida")
    .setColorBackground(color(0, 160, 100))
    .setColorLabel(color(255))
    .setColorActive(color(255, 128, 0))
    .setId(2);

  tab2 = cp5.addTab("Tab 2")
    .setColorBackground(color(0, 160, 100))
    .setColorLabel(color(255))
    .setColorActive(color(255, 128, 0))
    .setId(3);

  tab3 = cp5.addTab("Tab 3")
    .setColorBackground(color(0, 160, 100))
    .setColorLabel(color(255))
    .setColorActive(color(255, 128, 0))
    .setId(4);

  tab4 = cp5.addTab("Tab 4")
    .setColorBackground(color(0, 160, 100))
    .setColorLabel(color(255))
    .setColorActive(color(255, 128, 0))
    .setId(5);

  cp5.getTab("default")
    .activateEvent(true)
    .setLabel("home")
    .setId(1);
}

void addButtons()
{
  cp5.addButton("Flights")
    .setBroadcast(false)
    .setPosition(width/2-120, height/2-50)
    .setSize(80, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ;

  cp5.addButton("button2")
    .setBroadcast(false)
    .setPosition(width/2+40, height/2-50)
    .setSize(80, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ;

  cp5.addButton("button3")
    .setBroadcast(false)
    .setPosition(width/2-120, height/2+50)
    .setSize(80, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ;

  cp5.addButton("button4")
    .setBroadcast(false)
    .setPosition(width/2+40, height/2+50)
    .setSize(80, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ;

  cp5.addButton("home")
    .setPosition((width/2) - 40, (height/2)+50)
    .moveTo(tab2)
    .setSize(80, 40)
    ;
  cp5.addButton("home_copy1")
    .setPosition((width/2) - 40, (height/2)+120)
    .moveTo(tab3)
    .setSize(80, 40)
    .setLabel("home")
    ;
  cp5.addButton("home_copy2")
    .setPosition((width/2) - 40, (height/2)+50)
    .moveTo(tab4)
    .setSize(80, 40)
    .setLabel("home")
    ;
  cp5.addButton("home_copy3")
    .setPosition((width/2) - 40, (height/2)+50)
    .moveTo(flightTab)
    .setSize(80, 40)
    .setLabel("home")
    ;



  //cp5.getTab("Flights from Florida").add(cp5.getController("Home"));
}

//public void controlEvent(ControlEvent theEvent) {
//  println(theEvent.getController().getName());
//}
void controlEvent(ControlEvent event) {
  // update current tab only if the current event comes from a tab (and not other controllers)
  if (event.isTab()) {
    currentTab = event.getId();
  }
}
public void Flights(int theValue) {
  cp5.getTab("Flights from Florida").bringToFront();
  currentTab = 2;
}

public void button2(int theValue) {
  cp5.getTab("Tab 2").bringToFront();
  currentTab = 3;
}

public void button3(int theValue) {
  cp5.getTab("Tab 3").bringToFront();
  currentTab = 4;
}

public void button4(int theValue) {
  cp5.getTab("Tab 4").bringToFront();
  currentTab = 5;
}

public void Home(int theValue) {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}
public void home_copy1(int theValue) {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}
public void home_copy2(int theValue) {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}
public void home_copy3(int theValue) {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}
public void home(int theValue) {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}


void displayTabs() {
  switch(currentTab) {
  case 1:
    displayTab1();
    break;
  case 2:
    displayTab2();
    break;
  case 3:
    displayTab3();
    break;
  case 4:
    displayTab4();
    break;
  case 5:
    displayTab5();
    break;
  }
}
void displayTab1() {
}

void displayTab2() {
  //flChart.drawChart();
  // cp5.addDropdownList;
  //flChart.drawChart();
  if (screen == 1) {
    for (int i = 0; i < 50; i++) {
      
      noStroke();
      buttons[i].display();
      
    }
    // Display first screen
    float imageWidth = image.width * 0.6; // Reduce the width of the image to be 50% of its original size
    float imageHeight = image.height * 0.6; // Reduce the height of the image to be 50% of its original size
    float x = (width-imageWidth)/2; // Calculate the x position to center the image
    float y = height * 0.01 ; // Set the y position to be 10% from the top of the screen
    background(255);
    image(image, x, y, imageWidth, imageHeight);

  } else if (screen == 2) {
    // Display second screen
    background(#65C2DE);
    stroke(#050505);
    fill(#F784E2);
    buttons[50].display();
  }
}

void displayTab3() {
  text("Enter your start date and end date in the format mm/dd/yyyy - mm/dd/yyyy", 50, 100);
  fill(255);
  rect(175, 140, 250, 30);
  fill(0);
  input = input(50, 150);
  betweenDates = betweenDates(input, flightsArray);
  if (betweenDates.size() != 0)
  {
    text("Your date range has " + (betweenDates.size()+1) + " flights in it.", 50, 250);
    
    // we need to fix this so it prints the text properly - add scrolling maybe? 
    for (int i = 0; i < betweenDates.size(); i++ )
      text(i + " " + betweenDates.get(i).flightDate + " " + betweenDates.get(i).mktCarrier + " " + betweenDates.get(i).flightNum + " " +betweenDates.get(i).origin + " " +betweenDates.get(i).originCity + " " +betweenDates.get(i).originState +" " +
        betweenDates.get(i).originWAC + " " +betweenDates.get(i).dest + " " +betweenDates.get(i).destCity + " " +betweenDates.get(i).destState + " " +betweenDates.get(i).destWAC + " " +betweenDates.get(i).crsDepTime + " " +
        betweenDates.get(i).depTime + " " +betweenDates.get(i).crsArrTime +" " + betweenDates.get(i).arrTime + " " +betweenDates.get(i).cancelled + " " +betweenDates.get(i).diverted + " " +betweenDates.get(i).distance + "\n", 50, y1);
  }
}

void displayTab4() {
  pieChart.drawPieChart(width/2.0, height/2.0, 200.0, timeArray, colors);
  fill(#FF3E3E);
  text("cancelled", 20, height/2.0);
  fill(#FFF646);
  text("early", 20, (height/2.0)+20);
  fill(#54FF46);
  text("on time", 20, (height/2.0)+40);
  fill(#46E5FF);
  text("delayed", 20, (height/2.0)+60);
}

void displayTab5() {
  text("this is tab 4", 200, 200);
}

void initFlights() {
  int rowCount = theTable.getRowCount();
  for (int i = 0; i < rowCount; i++)
  {
    TableRow row = theTable.getRow(i);
    flightsArray.add(new DataPoint(row));
  }
}

void countCitiesInState() {
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

int[] sortOutPunctuality() {
  for (int i = 0; i < flightsArray.size(); i++)
  {
    int cancelledVar = int(flightsArray.get(i).cancelled);
    if ( cancelledVar == 1)
    {
      cancelledFlights++;
    } else
    {
      int predictArrTime = int(flightsArray.get(i).crsArrTime);
      int actArrTime = int(flightsArray.get(i).arrTime);
      int substraction = predictArrTime - actArrTime;
      if (substraction > 0)
      {
        earlyFlights++;
      } else if (substraction == 0)
      {
        onTimeFlights++;
      } else if (substraction < 0)
      {
        delayedFlights++;
      }
    } 
  }
  int[] timeArray = {cancelledFlights, earlyFlights, onTimeFlights, delayedFlights};
  return timeArray;
}

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
  
  
  void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].isMouseOver()) {
     
      if (i == 50) {
        screen = 1; // Go back to screen 1
      } else {
        screen = 2; // Go to screen 2
      }
      stateNumber = buttons[i].num; 
      println(stateNumber);
      break;
       
    }
  }
}
