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
  int chartX = 250;
  int chartY = 125;
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

    stroke(255);
    line(chartX, chartY, chartX, chartY + chartHeight); // y-axis
    line(chartX, chartY + chartHeight, chartX + (numBars+1) * barWidth, chartY + chartHeight); // x-axis

    // draw bars
    for (int i = 0; i < numBars; i++) {
    String key = (String) freqMap.keySet().toArray()[i];
    int frequency = freqMap.get(key);
    data[i] = frequency;
    names[i] = key;
    }
    for (int i = 0; i < numBars; i++) {
      int barHeight = data[i]*5;
      int x = chartX + (i+1) * barWidth;
      int y = chartY + chartHeight - barHeight/2;  //<>//
      fill(#EC48FF);
      rect(x, y, barWidth, barHeight);

      fill(255);

      // draw x-axis labels
      //textSize(15);
      textAlign(CENTER);
      text(names[i], x + barWidth/2 - 25, chartY + chartHeight + labelOffset);
    }
    for (int j = 70; j >= 0; j = j-5) {
        textAlign(RIGHT);
        text(j, chartX - labelOffset, chartY + 350-(j*5));
      }
      textAlign(LEFT);
      noStroke();
  }
}
