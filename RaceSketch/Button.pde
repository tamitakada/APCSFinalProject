public class Button {
  private float x;
  private float y;
  private float rectWidth;
  private float rectHeight;
  private color rectColor;
  
  private String label;
  private color textColor;
  private int textSize;
  
  public Button(float x, float y, float rectWidth, float rectHeight, color rectColor) {
    this.x = x; this.y = y;
    this.rectWidth = rectWidth; this.rectHeight = rectHeight;
    this.rectColor = rectColor;
    label = ""; textColor = 255; textSize = 20;
  }
  
  public void setLabel(String text, color textColor, int size) {
    label = text;
    this.textColor = textColor;
    textSize = size;
  }
  
  public boolean click(float x, float y) {
    return Math.abs(this.x - x) <= rectWidth / 2 && Math.abs(this.y - y) <= rectHeight / 2;
  }
  
  public void display() {
    noStroke();
    fill(rectColor);
    rectMode(CENTER);
    rect(x, y, rectWidth, rectHeight, 10);
    fill(textColor);
    textAlign(CENTER, CENTER);
    PFont myFont = createFont("Raleway-Regular.ttf", 32);
    textFont(myFont, textSize);
    text(label, x, y - 2, rectWidth, rectHeight);
  }
}
