class barChart { //<>//
  int[] data;
  String[] names;
  int numBars;
  int barWidth = 50;
  int chartHeight = 520;
  int chartX = 180;
  int chartY = 210;
  int labelOffset = 30;
  int j = 0;
  HashMap<String, Integer> freqMap;
  int maxVal;
 
  barChart(HashMap freqMap)
  {
    this.freqMap = freqMap;
    numBars = freqMap.size();
    data = new int[numBars];
    names = new String[numBars];
    maxVal = Integer.MIN_VALUE;
    ArrayList<Integer> valuesList = new ArrayList<Integer>(freqMap.values());
    for (int value : valuesList) {
    if (value > maxVal) {
        maxVal = value;
      }
    }
  }

  void drawChart() {
    // draw chart axes
    stroke(0);
    line(chartX, chartY - 40, chartX, chartY + chartHeight); // y-axis
    line(chartX, chartY + chartHeight, chartX + (numBars+1) * barWidth, chartY + chartHeight); // x-axis

    // draw bars
    for (int i = 0; i < numBars; i++) {
      String key = (String) freqMap.keySet().toArray()[i];
      int frequency = freqMap.get(key);
      data[i] = frequency;
      names[i] = key;
    }
    for (int i = 0; i < numBars; i++) {
      int barHeight = (int) (data[i] * 1.0 / maxVal * chartHeight);
      int x = chartX + (i+1) * barWidth;
      int y = chartY + chartHeight - barHeight/2;
      fill(#EC48FF);
      rect(x, y, barWidth, barHeight);

      fill(255);

      // draw x-axis labels
      //textSize(15);
      textAlign(CENTER);
      fill(0);
      text(names[i], x + barWidth/2 - 25, chartY + chartHeight + labelOffset);
      
      // draw the values of each bar over the bar
      textSize(18);
      text(Integer.toString(data[i]), x + barWidth/2 - 25, chartY + chartHeight + labelOffset -barHeight-35);
      
    }
     text("All airports from the selected state" , (chartX + (numBars+1) * barWidth)/1.5, chartY + chartHeight + 70);
     
     pushMatrix();
     float angle1 = radians(270);
     translate(-380,500);
     rotate(angle1);
     text("Number of Flights",50, 450);
     popMatrix();
    // draw y-axis labels
    textAlign(RIGHT);
    for (int j = maxVal; j >= 0; j -= (int) Math.ceil(maxVal/10.0)) {
      int y = chartY + chartHeight - (int) (j * 1.0 / maxVal * chartHeight);
      text(j, chartX - labelOffset, y);
      text("-", chartX+4.5,y);
    }
    textAlign(LEFT);
    noStroke();
  }
}
