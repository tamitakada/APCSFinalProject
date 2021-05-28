public class Button {
  private float x;
  private float y;
  private float rectWidth;
  private float rectHeight;
  private color rectColor;
  private String label;
  
  public Button(float x, float y, float rectWidth, float rectHeight, color rectColor, String label) {
    this.x = x; this.y = y;
    this.rectWidth = rectWidth; this.rectHeight = rectHeight;
    this.rectColor = rectColor;
    this.label = label;
  }
  
  public boolean click(float x, float y) {
    return Math.abs(this.x - x) <= rectWidth / 2 && Math.abs(this.y - y) <= rectHeight / 2;
  }
  
  public void display() {
    noStroke();
    fill(rectColor);
    rectMode(CENTER);
    rect(x, y, rectWidth, rectHeight, 10);
    fill(255);
    textAlign(CENTER, CENTER);
    PFont myFont = createFont("Raleway-Regular.ttf", 32);
    textFont(myFont, 20);
    text(label, x, y - 2, rectWidth, rectHeight);
  }
}
