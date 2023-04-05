class ScreenButton {
  float x, y, width, height;
  int num;
  
  ScreenButton(float x, float y, float width, float height, int num) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.num = num;
  }
  
  void display() {
    rect(x, y, width, height);
    //textAlign(CENTER, CENTER);
   
  }
  
  boolean isMouseOver() {
    return mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height;
  }
}
