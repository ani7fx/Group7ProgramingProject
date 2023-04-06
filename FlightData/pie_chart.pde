class PieChart {
  int total = 0;
  float lastAngle, mouseAngle;


  PieChart ( float pX, float pY) {
    noStroke();
    lastAngle = -PI;
    mouseAngle = atan2(mouseY - pY, mouseX - pX);
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

      if ( mouseAngle >= lastAngle && mouseAngle < lastAngle+angle ) {
        text(pVal[i] /total, pX-pDia/2, pY-pDia/2);
      }
      lastAngle += angle;
    }
  }
}
