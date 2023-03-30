

int[] values = {32,11 , 7};
int[] colors = {#E4000F, #655CBE, #107C10};




class PieChart {
  
  void pieChart ( float pX, float pY, float pDia, int[] pVal, int[]pCols) {
    noStroke();
    float total = 0;
    float lastAngle = -PI;
    float mouseAngle = atan2(mouseY - pY, mouseX - pX);
    
    for (int i = 0; i <pVal.length; i ++) {
      total += pVal[i];
    }
    
    for (int i =0; i<pVal.length; i++) {
      fill(pCols[i]);
      float angle = map(pVal[i], 0, total, 0, 2*PI);
      arc(pX, pY, pDia, pDia, lastAngle, lastAngle+angle, PIE);

      if ( mouseAngle >= lastAngle && mouseAngle < lastAngle+angle ) {
        text(values[i] + "/50)", pX-pDia/2, pY-pDia/2);
      }
      lastAngle += angle;
    }
  }
}
