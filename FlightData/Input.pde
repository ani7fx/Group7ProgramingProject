String typing = "";
String saved = "";

String input(int inX, int inY) {
  text(typing, inX, inY);
  return saved;
}

void keyPressed() {
  if (keyCode == DOWN && endIndex < betweenDates.size())
  {
    startIndex++;
    endIndex++;
  }
  if (keyCode == UP && startIndex > 0)
  {
    startIndex--;
    endIndex--;
  }

  if (key == '\n') {
    saved = typing;
    typing = "";
  } else typing = typing + key;
}
