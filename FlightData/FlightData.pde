import java.util.Scanner;
Table theTable;
ArrayList <DataPoint> flightsArray;

void setup() {
  theTable = loadTable("flights2k.csv", "header");
  initFlights();
   flightsArray = new ArrayList<DataPoint>();
}

void initFlights() {
  int rowCount = theTable.getRowCount();
  for (int i = 0; i < rowCount ; i++)
  {
    TableRow row = theTable.getRow(i);
    flightsArray.add(new DataPoint(row));
  }
}
void draw() {
}
