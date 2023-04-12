class PieChart {
  int total = 0;
  float lastAngle, mouseAngle;
  boolean[] showSlice;


  PieChart(float pX, float pY) {
  noStroke();
  lastAngle = -PI;
  mouseAngle = atan2(mouseY - pY, mouseX - pX);
  showSlice = new boolean[0];
}

  void drawPieChart(float pX, float pY, float pDia, int[] pVal, int[]pCols)
  {
    int total = 0;
    for (int i = 0; i <pVal.length; i++) {
      total += pVal[i];
    }
    for (int i = 0; i <pVal.length; i++) {
      fill(pCols[i]);
      float angle = map(pVal[i], 0, total, 0, 2*PI);
      arc(pX, pY, pDia, pDia, lastAngle, lastAngle+angle, PIE);
      float labelX = pX + cos(lastAngle + angle / 2) * (pDia / 2 * 0.9);
float labelY = pY + sin(lastAngle + angle / 2) * (pDia / 2 * 0.9);

if (angle > PI/2 && angle < 3*PI/2) {
  // Move label to the left for slices on the left side
  labelX -= textWidth(str(pVal[i])) + 0;
} else {
  // Move label to the right for slices on the right side
  labelX += 20;
}

fill(0);
text(str(pVal[i]), labelX, labelY + 15);

      lastAngle += angle;
    }
  }
}
