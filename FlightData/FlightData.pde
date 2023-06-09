import controlP5.*; //<>//
ControlP5 cp5;
int currentTab = 1;

Table theTable;
ArrayList <DataPoint> flightsArray = new ArrayList<DataPoint>();
// all fonts
PFont standard;
PFont appName;
PFont ornaments;
PFont bodyFont;

PImage statesImage;
PImage plane;

String input;
HashMap<String, Integer> freqMap = new HashMap<String, Integer>();
ArrayList<DataPoint> betweenDates;
int y1 = 300; //starting y value for date data
int y2 = 20; // y multiple for date data
int startIndex = 0;
int endIndex = 30;

// initialisations for sort out punctuality
int cancelledFlights = 0;
int earlyFlights = 0;
int onTimeFlights = 0;
int delayedFlights = 0;
PieChart pieChart;


Tab flightTab, tab2, tab3, tab4;
String[] stateAcronymLines;
String[] stateAcronyms;
ScreenButton[] buttons = new ScreenButton[51]; // for sort by state
int screen = 1;
int stateNumber;

barChart barChart;
barChart[] myBarCharts = new barChart[50];
int colors[] = {#B456AE, #B66FD3, #D4B0F2, #D364BB};
int timeArray[];

//histogram bins and names;
Histogram histogram;
String[] names = {"0-500", "500-1000", "1000-1500", "1500-2000", "2000-2500", "2500-3000", "3000-3500", "4000-4500", "4500-5000", "5000+"};
int[] data = new int[names.length];
int bin1 = 0;
int bin2 = 0;
int bin3 = 0;
int bin4 = 0;
int bin5 = 0;
int bin6 = 0;
int bin7 = 0;
int bin8 = 0;
int bin9 = 0;
int bin10 = 0;

void setup() {
  size(1500, 900);
  cp5 = new ControlP5(this);
  theTable = loadTable("flights_full.csv", "header");
  stateAcronymLines = loadStrings("State Acronyms.csv");
  stateAcronyms = split(stateAcronymLines[0], ',');
  statesImage = loadImage("usstatesbc__90159.jpg");
  initFlights();
  noStroke();
  rectMode(CENTER);
  addTabs();
  addButtons();
  appName = loadFont("Georgia-BoldItalic-120.vlw");
  ornaments = loadFont("BodoniOrnamentsITCTT-120.vlw");
  bodyFont = loadFont("Charter-Black-40.vlw");
  standard =loadFont("ArialMT-20.vlw");
  textFont(standard);
  barChart = new barChart(freqMap);
  timeArray = sortOutPunctuality();
  pieChart = new PieChart(width/2.0, height/2.0);
  sortoutDistance();
  histogram = new Histogram(data, names);
  textSize(20);
  initStateButtons();
  for (int i = 0; i < myBarCharts.length; i++) {
    freqMap = countCitiesInState(stateAcronyms[i]);
    myBarCharts[i] = new barChart(freqMap);
  }
  plane = loadImage("finalplane.png");
  plane.resize(800, 0);
}

void initStateButtons()
{

  buttons[0] = new ScreenButton( 250, 39, 84, 55, 0); //alabama
  buttons[1] = new ScreenButton(250, 110, 84, 55, 1); //goes down to virginia
  buttons[2] = new ScreenButton(250, 182, 84, 55, 2);
  buttons[3] = new ScreenButton(250, 253, 84, 55, 3);
  buttons[4] = new ScreenButton(250, 327, 84, 55, 4);
  buttons[5] = new ScreenButton(250, 402, 84, 55, 5);
  buttons[6] = new ScreenButton(250, 477, 84, 55, 6);
  buttons[7] = new ScreenButton(250, 553, 84, 55, 7);
  buttons[8] = new ScreenButton(250, 620, 84, 55, 8);
  buttons[9] = new ScreenButton(250, 700, 84, 55, 9);  //virginia
  buttons[10] = new ScreenButton(350, 39, 84, 55, 10); //2nd row
  buttons[11] = new ScreenButton(350, 110, 84, 55, 11);
  buttons[12] = new ScreenButton(350, 182, 84, 55, 12);
  buttons[13] = new ScreenButton(350, 253, 84, 55, 13);
  buttons[14] = new ScreenButton(350, 327, 84, 55, 14);
  buttons[15] = new ScreenButton(350, 402, 84, 55, 15);
  buttons[16] = new ScreenButton(350, 477, 84, 55, 16);
  buttons[17] = new ScreenButton(350, 553, 84, 55, 17);
  buttons[18] = new ScreenButton(350, 620, 84, 55, 18);
  buttons[19] = new ScreenButton(350, 700, 84, 55, 19); //washington
  buttons[20] = new ScreenButton(452, 39, 84, 55, 20);  //3rd column
  buttons[21] = new ScreenButton(452, 110, 84, 55, 21);
  buttons[22] = new ScreenButton(452, 182, 84, 55, 22);
  buttons[23] = new ScreenButton(452, 253, 84, 55, 23);
  buttons[24] = new ScreenButton(452, 327, 84, 55, 24);
  buttons[25] = new ScreenButton(452, 402, 84, 55, 25);
  buttons[26] = new ScreenButton(452, 477, 84, 55, 26);
  buttons[27] = new ScreenButton(452, 553, 84, 55, 27);
  buttons[28] = new ScreenButton(452, 620, 84, 55, 28);
  buttons[29] = new ScreenButton(452, 700, 84, 55, 29);  //west virginia
  buttons[30] = new ScreenButton(553, 39, 84, 55, 30);   // 4th column
  buttons[31] = new ScreenButton(553, 110, 84, 55, 31);
  buttons[32] = new ScreenButton(553, 182, 84, 55, 32);
  buttons[33] = new ScreenButton(553, 253, 84, 55, 33);
  buttons[34] = new ScreenButton(553, 327, 84, 55, 34);
  buttons[35] = new ScreenButton(553, 402, 84, 55, 35);
  buttons[36] = new ScreenButton(553, 477, 84, 55, 36);
  buttons[37] = new ScreenButton(553, 553, 84, 55, 37);
  buttons[38] = new ScreenButton(553, 620, 84, 55, 38);
  buttons[39] = new ScreenButton(553, 700, 84, 55, 39);  // wisconsin
  buttons[40] = new ScreenButton(653, 39, 84, 55, 40);  // 5th column
  buttons[41] = new ScreenButton(653, 110, 84, 55, 41);
  buttons[42] = new ScreenButton(653, 182, 84, 55, 42);
  buttons[43] = new ScreenButton(653, 253, 84, 55, 43);
  buttons[44] = new ScreenButton(653, 327, 84, 55, 44);
  buttons[45] = new ScreenButton(653, 402, 84, 55, 45);
  buttons[46] = new ScreenButton(653, 477, 84, 55, 46);
  buttons[47] = new ScreenButton(653, 553, 84, 55, 47);
  buttons[48] = new ScreenButton(653, 620, 84, 55, 48);
  buttons[49] = new ScreenButton(653, 700, 84, 55, 49);

  buttons[50] = new ScreenButton(110, 39, 84, 55, 51);  // button screen 2
}

void draw()
{
  background(254, 193, 255);
  displayTabs();
}

// initialise datePoints in flightsArray
void initFlights() {
  int rowCount = theTable.getRowCount();
  for (int i = 0; i < rowCount; i++)
  {
    TableRow row = theTable.getRow(i);
    flightsArray.add(new DataPoint(row));
  }
}

void addTabs()
{
  // creating the tabs
  flightTab = cp5.addTab("Flights from Florida")
    .setColorBackground(color(211, 79, 205))
    .setColorLabel(color(255))
    .setColorActive(color(219, 164, 216))
    .setId(2)
    .setHeight(40)
    .setLabel("Sort by state");

  tab2 = cp5.addTab("Tab 2")
    .setColorBackground(color(211, 79, 205))
    .setColorLabel(color(255))
    .setColorActive(color(219, 164, 216))
    .setId(3)
    .setHeight(40)
    .setLabel("Sort By Date");

  tab3 = cp5.addTab("Tab 3")
    .setColorBackground(color(211, 79, 205))
    .setColorLabel(color(255))
    .setColorActive(color(219, 164, 216))
    .setId(4)
    .setHeight(40)
    .setLabel("Flight Status");

  tab4 = cp5.addTab("Tab 4")
    .setColorBackground(color(211, 79, 205))
    .setColorLabel(color(255))
    .setColorActive(color(219, 164, 216))
    .setId(5)
    .setHeight(40)
    .setLabel("Distance");

  cp5.getTab("default")
    .activateEvent(true)
    .setLabel("home")
    .setId(1)
    .setHeight(40)
    .setColorActive(color(259, 164, 216))
    .setColorBackground(color(#B456AF));
}

void addButtons()
{
  // create the buttons
  cp5.addButton("Flights")
    .setBroadcast(false)
    .setPosition(width/2-120, height/2-50)
    .setSize(80, 40)
    .setValue(1)
    .setBroadcast(true)
    .setLabel("Sort By State")
    .setColorBackground(color(#B456AE));

  cp5.addButton("button2")
    .setBroadcast(false)
    .setPosition(width/2+40, height/2-50)
    .setSize(80, 40)
    .setValue(1)
    .setBroadcast(true)
    .setLabel("Sort By Date")
    .setColorBackground(color(#B66FD3));

  cp5.addButton("button3")
    .setBroadcast(false)
    .setPosition(width/2-120, height/2+50)
    .setSize(80, 40)
    .setValue(1)
    .setBroadcast(true)
    .setLabel("Flight Status")
    .setColorBackground(color(#D4B0F2));

  cp5.addButton("button4")
    .setBroadcast(false)
    .setPosition(width/2+40, height/2+50)
    .setSize(80, 40)
    .setValue(1)
    .setBroadcast(true)
    .setLabel("Distance")
    .setColorBackground(color(#D364BB));

  cp5.addButton("home_copy1")
    .setPosition((width/2) - 40, (height/2)+120)
    .moveTo(tab3)
    .setSize(80, 40)
    .setLabel("home");
}

void controlEvent(ControlEvent event) {
  // update current tab only if the current event comes from a tab (and not other controllers)
  if (event.isTab()) {
    currentTab = event.getId();
  }
}
public void Flights() {
  cp5.getTab("Flights from Florida").bringToFront();
  currentTab = 2;
}

public void button2() {
  cp5.getTab("Tab 2").bringToFront();
  currentTab = 3;
}

public void button3() {
  cp5.getTab("Tab 3").bringToFront();
  currentTab = 4;
}

public void button4() {
  cp5.getTab("Tab 4").bringToFront();
  currentTab = 5;
}

public void Home() {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}
public void home_copy1() {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}
public void home_copy2() {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}
public void home_copy3() {
  cp5.getTab("default").bringToFront();
  currentTab = 1;
}
public void home() {
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

// show content of tabs
void displayTab1() {
  tint(0, 50);
  image(plane, width/2 - 400, height/2 - 350);
  textFont(appName);
  textSize(120);
  fill(255);
  text("RALSAIR", width/2 - 270, 250);
  fill(253, 160, 255);
  text("RALSAIR", width/2 - 270 - 5, 250);
  fill(251, 144, 255);
  text("RALSAIR", width/2 - 270 - 10, 250);
  textFont(ornaments);
  text("B", width/2 - 340, 250);
  text("B", width/2 + 330, 250);
  textSize(20);
  textFont(standard);
  noTint();
}

void displayTab2() {
  if (screen == 1) {
    for (int i = 0; i < 50; i++) {
      noStroke();
      buttons[i].display();
    }
    // Display first screen
    float imageWidth = statesImage.width * 0.6; // Reduce the width of the image to be 50% of its original size
    float imageHeight = statesImage.height * 0.6; // Reduce the height of the image to be 50% of its original size
    float x = (1000-imageWidth)/2; // Calculate the x position to center the image
    float y = 1000 * 0.01 ; // Set the y position to be 10% from the top of the screen
    background(255);
    noTint();
    image(statesImage, x, y, imageWidth, imageHeight);
    textFont(appName);
    textSize(60);
    text("Select a state", 870, 370);
    text("to view flights", 850, 450);
    textFont(standard);
  } else if (screen == 2) {
    // Display second screen
    background(254, 193, 255);
    stroke(255);
    fill(255);
    myBarCharts[stateNumber].drawChart();
    buttons[50].display();
  }
}

void displayTab3() {
  textFont(appName);
  textSize(60);
  fill(255);
  text("SORT BY DATE", 804, 100);
  fill(253, 160, 255);
  text("SORT BY DATE", 802, 100);
  fill(251, 144, 255);
  text("SORT BY DATE", 800, 100);
  textFont(ornaments);
  textSize(60);
  text("B", width/2 + 25, 100);
  text("B", width/2 + 545, 100);
  textSize(20);
  textFont(standard);
  
  fill(0);
  text("Enter your start date and end date in the format mm/dd/yyyy - mm/dd/yyyy", 50, 100);
  fill(255);
  rect(175, 140, 250, 30);
  fill(0);
  input = input(50, 150);
  betweenDates = betweenDates(input, flightsArray);
  if (betweenDates.size() != 0)
  {
    text("Your date range has " + (betweenDates.size()+1) + " flights in it. To search again, just enter a new date range.", 50, 250);
    String[] printOut = new String[betweenDates.size()];
    for (int i = 0; i < betweenDates.size(); i++ ) { //Create an array with all printable data
      printOut[i] = i + " | Jan " + betweenDates.get(i) .day + " | " + betweenDates.get(i).origin + " " +betweenDates.get(i).originCity + " to " +betweenDates.get(i).dest + " " +
        betweenDates.get(i).destCity + ". Departed: " + betweenDates.get(i).depTime +". Arrived: " + betweenDates.get(i).arrTime + ". Distance: " +betweenDates.get(i).distance;
    }
    for (int i = 0; i < endIndex-startIndex; i++) // Print date within date range
    {
      text(printOut[startIndex + i], 20, y1 + (y2*i));
    }
  }
}

void displayTab4() {
  pieChart.drawPieChart(width/2.0, height/2.0-50, 300.0, timeArray, colors);
  textFont(appName);
  textSize(60);
  fill(255);
  text("FLIGHT ARRIVAL TIMES", width/2 - 400, 220);
  fill(253, 160, 255);
  text("FLIGHT ARRIVAL TIMES", width/2 - 400 - 3, 220);
  fill(251, 144, 255);
  text("FLIGHT ARRIVAL TIMES", width/2 - 400 - 7, 220);
  textFont(ornaments);
  textSize(60);
  text("B", width/2 - 440, 220);
  text("B", width/2 + 420, 220);
  textFont(bodyFont);
  fill(#B456AE);
  text("Cancelled", 40, height/2.0 - 100);
  fill(#B66FD3);
  text("Early", 40, (height/2.0)-60);
  fill(#D4B0F2);
  text("On time", 40, (height/2.0)-20);
  fill(#D364BB);
  text("Delayed", 40, (height/2.0)+20);
  textFont(standard);
}

void displayTab5() {
  textFont(appName);
  textSize(60);
  fill(255);
  text("FLIGHT DISTANCES", width/2 - 294, 180);
  fill(253, 160, 255);
  text("FLIGHT DISTANCES", width/2 - 297 , 180);
  fill(251, 144, 255);
  text("FLIGHT DISTANCES", width/2 - 300, 180);
  textFont(ornaments);
  textSize(60);
  text("B", width/2 - 325, 180);
  text("B", width/2 + 360, 180);

  textFont(standard);
  histogram.drawChart();
}

HashMap countCitiesInState(String state) {
  HashMap<String, Integer> freqMap = new HashMap<String, Integer>();
  ArrayList <String> stateAirports = new ArrayList<String>();
  for (int i = 0; i < flightsArray.size(); i++)
  {
    if (flightsArray.get(i).originState.equals(state))
    {
      stateAirports.add(flightsArray.get(i).origin);
    }
  }

  for (String city : stateAirports) {
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
  return freqMap;
}

void sortoutDistance () {
  float currentDist;
  for (int i = 0; i < flightsArray.size(); i++)
  {
    currentDist = Float.parseFloat(flightsArray.get(i).distance);
    if (currentDist < 500) {
      bin1++;
    } else if (currentDist < 1000) {
      bin2++;
    } else if (currentDist < 1500) {
      bin3++;
    } else if (currentDist < 2000) {
      bin4++;
    } else if (currentDist < 2500) {
      bin5++;
    } else if (currentDist < 3000) {
      bin6++;
    } else if (currentDist < 3500) {
      bin7++;
    } else if (currentDist < 4000) {
      bin8++;
    } else if (currentDist < 4500) {
      bin9++;
    } else {
      bin10++;
    }
  }
  data[0] = bin1;
  data[1] = bin2;
  data[2] = bin3;
  data[3] = bin4;
  data[4] = bin5;
  data[5] = bin6;
  data[6] = bin7;
  data[7] = bin8;
  data[8] = bin9;
  data[9] = bin10;
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
