class DataPoint {
  String flightDate, mktCarrier, flightNum, origin, originCity, originState,
  originWAC, dest, destCity, destState, destWAC, crsDepTime, depTime, crsArrTime,
  arrTime, cancelled, diverted, distance;
  
  DataPoint(TableRow row)
  {
    
    flightDate = row.getString("FL_DATE");
    mktCarrier = row.getString("MKT_CARRIER");
    flightNum = row.getString("MKT_CARRIER_FL_NUM");
    origin = row.getString("ORIGIN");
    originCity = row.getString("ORIGIN_CITY_NAME");
    originState = row.getString("ORIGIN_STATE_ABR");
    originWAC = row.getString("ORIGIN_WAC");
    dest = row.getString("DEST");
    destCity = row.getString("DEST_CITY_NAME");
    destState = row.getString("DEST_STATE_ABR");
    destWAC = row.getString("DEST_WAC");
    crsDepTime = row.getString("CRS_DEP_TIME");
    depTime = row.getString("DEP_TIME");
    crsArrTime = row.getString("CRS_ARR_TIME");
    arrTime = row.getString("ARR_TIME");
    cancelled = row.getString("CANCELLED");
    diverted = row.getString("DIVERTED");
    distance = row.getString("DISTANCE");
    
  }
  
  //==:df.loc[df['ORIGIN'] == 'JFK']
  
  //void setup()
  //{
  //  println("What U.S.A. state do you want to know the number of flights of?");
    
  //   String name = getString("Enter your name:");
  //   //print("Hello " + name + ".  You are " + age);
  //   //print(" years old and you have $" + money + "!  Your");
  //   //println(" gender is " + gender + ".");
  //}
   
}
