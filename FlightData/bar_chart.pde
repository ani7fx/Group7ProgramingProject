



//void setup() {
//  size(500, 500);
//  background(255);
//  drawChart();
//}
class barChart {
  int[] data; // place where u put information
  String[] names;
  int numBars;
  int barWidth = 50;
  int chartHeight = 350;
  int chartX = 150;
  int chartY = 50;
  int labelOffset = 30;
  int j = 0;
  HashMap<String, Integer> freqMap;

  barChart(HashMap freqMap)
  {
    this.freqMap = freqMap;
    numBars = freqMap.size();
    data = new int[numBars];
    names = new String[numBars];
  }

  void drawChart() {
    // draw chart axes

    stroke(0);
    line(chartX, chartY, chartX, chartY + chartHeight); // y-axis
    line(chartX, chartY + chartHeight, chartX + (numBars+1) * barWidth, chartY + chartHeight); // x-axis

    // draw bars
    for (String key : freqMap.keySet())
    {
      int frequency = freqMap.get(key);
      System.out.println(key + ": " + frequency);
      data[j] = frequency;
      names[j] = key;
      j++;
    }
    for (int i = 0; i < numBars; i++) {
      int barHeight = data[i]*5;
      int x = chartX + (i+1) * barWidth;
      int y = chartY + chartHeight - barHeight;
      fill(0, 0, 255);
      rect(x, y, barWidth, barHeight);

      fill(0);

      //for (int j = 0; j < 350; j = j+5) {
        textAlign(RIGHT);
        text(barHeight/5, chartX - labelOffset, y + barHeight/5);
      //}

      // draw x-axis labels
      textSize(15);
      textAlign(CENTER);
      text(names[i], x + barWidth/2, chartY + chartHeight + labelOffset);
    }
  }
}
