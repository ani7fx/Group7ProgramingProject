import controlP5.*; //<>// //<>// //<>//

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
int y = 30;

barChart flChart;
Tab flightTab, tab2, tab3, tab4;

int delayedFlights = 0;

void setup()
{
  theTable = loadTable("flights2k.csv", "header");
  initFlights();
  size(900,900);
  cp5 = new ControlP5(this);
  noStroke();
  rectMode(CENTER);
  addTabs();
  addButtons();
  
  
  standard =loadFont("ArialMT-20.vlw");
  textFont(standard);
  countCitiesInState();
  flChart = new barChart(freqMap);
  textSize(20);
}

void draw()
{
  background(100,160,100);
  displayTabs();
}

void addTabs()
{
   flightTab = cp5.addTab("Flights from Florida")
     .setColorBackground(color(0, 160, 100))
     .setColorLabel(color(255))
     .setColorActive(color(255,128,0))
     .setId(2);
     
   tab2 = cp5.addTab("Tab 2")
     .setColorBackground(color(0, 160, 100))
     .setColorLabel(color(255))
     .setColorActive(color(255,128,0))
     .setId(3);
     
   tab3 = cp5.addTab("Tab 3")
     .setColorBackground(color(0, 160, 100))
     .setColorLabel(color(255))
     .setColorActive(color(255,128,0))
     .setId(4);
   
   tab4 = cp5.addTab("Tab 4")
     .setColorBackground(color(0, 160, 100))
     .setColorLabel(color(255))
     .setColorActive(color(255,128,0))
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
     .setPosition(width/2-120,height/2-50)
     .setSize(80,40)
     .setValue(1)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
   cp5.addButton("button2")
     .setBroadcast(false)
     .setPosition(width/2+40,height/2-50)
     .setSize(80,40)
     .setValue(1)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
   cp5.addButton("button3")
     .setBroadcast(false)
     .setPosition(width/2-120,height/2+50)
     .setSize(80,40)
     .setValue(1)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
   cp5.addButton("button4")
     .setBroadcast(false)
     .setPosition(width/2+40,height/2+50)
     .setSize(80,40)
     .setValue(1)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
     cp5.addButton("home")
     .setPosition((width/2) - 40, (height/2)+50)
     .moveTo(tab2)
     .setSize(80,40)
     ;
     cp5.addButton("home_copy1")
     .setPosition((width/2) - 40, (height/2)+50)
     .moveTo(tab3)
     .setSize(80,40)
     .setLabel("home")
     ;
     cp5.addButton("home_copy2")
     .setPosition((width/2) - 40, (height/2)+50)
     .moveTo(tab4)
     .setSize(80,40)
     .setLabel("home")
     ;
     cp5.addButton("home_copy3")
     .setPosition((width/2) - 40, (height/2)+50)
     .moveTo(flightTab)
     .setSize(80,40)
     .setLabel("home")
     ;
     

     
   //cp5.getTab("Flights from Florida").add(cp5.getController("Home"));
}

//public void controlEvent(ControlEvent theEvent) {
//  println(theEvent.getController().getName());
//}
void controlEvent(ControlEvent event) {
  // update current tab only if the current event comes from a tab (and not other controllers) 
  if(event.isTab()){
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
  currentTab = 4;
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


void displayTabs(){
  switch(currentTab){
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
  }
}
void displayTab1(){
}

void displayTab2(){
  //flChart.drawChart();
 // cp5.addDropdownList;
   flChart.drawChart();
}

void displayTab3() {
  text("Enter your start date and end date in the format mm/dd/yyyy - mm/dd/yyyy", 50, 100);
      fill(255);
      rect(50, 120, 250, 30);
      fill(0);
      input = input (50, 150);
      betweenDates = betweenDates(input, flightsArray);
      if (betweenDates.size() != 0)
      {
        text("Your date range has " + (betweenDates.size()+1) + " flights in it.", 50, 250);
        for (int i = 0; i < betweenDates.size(); i++ )
          text(i + " " + betweenDates.get(i).flightDate + " " + betweenDates.get(i).mktCarrier + " " + betweenDates.get(i).flightNum + " " +betweenDates.get(i).origin + " " +betweenDates.get(i).originCity + " " +betweenDates.get(i).originState +" " +
            betweenDates.get(i).originWAC + " " +betweenDates.get(i).dest + " " +betweenDates.get(i).destCity + " " +betweenDates.get(i).destState + " " +betweenDates.get(i).destWAC + " " +betweenDates.get(i).crsDepTime + " " +
            betweenDates.get(i).depTime + " " +betweenDates.get(i).crsArrTime +" " + betweenDates.get(i).arrTime + " " +betweenDates.get(i).cancelled + " " +betweenDates.get(i).diverted + " " +betweenDates.get(i).distance + "\n", 50, y);
      }
}

void displayTab4() {
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

//void sortOutPunctuality() {
//  for (int i = 0; i < flightsArray.size(); i++)
//  {
//    int cancelledVar = int(flightsArray.get(i).cancelled);
//    if ( cancelledVar == 1)
//    {
//      cancelledFlights++;
//    } else
//    {
//      int predictArrTime = int(flightsArray.get(i).crsArrTime);
//      int actArrTime = int(flightsArray.get(i).arrTime);
//      int substraction = predictArrTime - actArrTime;
//      if (substraction > 0)
//      {
//        earlyFlights++;
//      } else if (substraction == 0)
//      {
//        onTimeFlights++;
//      } else if (substraction < 0)
//      {
//        delayedFlights++;
//      }
//    }
//    int timeArray []= {cancelledFlights, earlyFlights, onTimeFlights, delayedFlights};
//    int[] colors = {#FF3E3E, #FFF646, #54FF46, #46E5FF};
//  }
//}
