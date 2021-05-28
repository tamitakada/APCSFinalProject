public class Button {
  private float x;
  private float y;
  private float rectWidth;
  private float rectHeight;
  private color rectColor;
  
  public Button(float x, float y, float rectWidth, float rectHeight, color rectColor) {
    this.x = x; this.y = y;
    this.rectWidth = rectWidth; this.rectHeight = rectHeight;
    this.rectColor = rectColor;
  }
  
  public boolean click(float x, float y) {
    return Math.abs(this.x - x) <= rectWidth / 2 && Math.abs(this.y - y) <= rectHeight;
  }
  
  public void display() {
    noStroke();
    fill(rectColor);
    rectMode(CENTER);
    rect(x, y, rectWidth, rectHeight, 10);
  }
}
