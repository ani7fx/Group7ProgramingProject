

int[] data = {80, 120, 200, 80, 160}; // place where u put information
int numBars = data.length;
int barWidth = 50;
int chartHeight = 300;
int chartX = 350;
int chartY = 50;
int labelOffset = 10;

//void setup() {
//  size(500, 500);
//  background(255);
//  drawChart();
//}

void drawChart() {
   // draw chart axes
  
  stroke(0);
  line(chartX, chartY, chartX, chartY + chartHeight); // y-axis
  line(chartX, chartY + chartHeight, chartX + (numBars+1) * barWidth, chartY + chartHeight); // x-axis
  
  // draw bars
  for (int i = 0; i < numBars; i++) {
    int barHeight = data[i];
    int x = chartX + (i+1) * barWidth;
    int y = chartY + chartHeight - barHeight;
    fill(0, 0, 255);
    rect(x, y, barWidth, barHeight);
    
     fill(0);
    textAlign(RIGHT);
    text(data[i], chartX - labelOffset, y + barHeight/2);
  
    // draw x-axis labels
    textAlign(CENTER);
    text(i+1, x + barWidth/2, chartY + chartHeight + labelOffset);
  }
}
