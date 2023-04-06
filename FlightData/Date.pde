String date; //<>// //<>// //<>//
int month, day, year, startDay, endDay;

int dateSort(String date)
{
  this.date = date;
  String[] parts = date.split(" ");
  String[] dateParts = parts[0].split("/");
  month = Integer.parseInt(dateParts[0]);
  day = Integer.parseInt(dateParts[1]);
  year = Integer.parseInt(dateParts[2]);
  //print("Month:", month);
  //print("Day:", day);
  //println("Year:", year);
  return day;
}

ArrayList<DataPoint> betweenDates(String dates, ArrayList<DataPoint> flightsArray) {
  ArrayList<DataPoint> betweenDates = new ArrayList<DataPoint>();
  String[] parts = dates.split(" - ");
  if (parts.length < 2) text("Make sure your format is exactly as shown", 50, 200);
  else {
    String[] startDate = parts[0].split("/");
    String[] endDate = parts[1].split("/");
    startDay = Integer.parseInt(startDate[1]);
    endDay = Integer.parseInt(endDate[1]);
  }
  for (DataPoint point : flightsArray) {
    if (point.day >= startDay && point.day <= endDay)
    {
      betweenDates.add(point);
    }
  }
  return betweenDates;
}
