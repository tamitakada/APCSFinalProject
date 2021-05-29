public class Label {
  private float x;
  private float y;
  
  private String text;
  private color textColor;
  private int textSize;
  private int textAlignX;
  private int textAlignY;
  private Font font;
  
  public Label(float x, float y, String text) {
    this.x = x; this.y = y; this.text = text;
    textSize = 20;
    textColor = 255; font = Font.RALEWAY;
    textAlignX = CENTER; textAlignY = CENTER;
  }
  
  public void setColor(color textColor) {
    this.textColor = textColor;
  }
  
  public void setSize(int size) {
    textSize = size;
  }
  
  public void setAlignment(int x, int y) {
    textAlignX = x; textAlignY = y;
  }
  
  public void setFont(Font font) {
    this.font = font; 
  }
  
  private PFont bungeeHairline = createFont("BungeeHairline-Reg.ttf", 40);
  private PFont raleway = createFont("Raleway-Regular.ttf", 40);
  private PFont bungeeInline = createFont("BungeeInline-Regular.ttf", 40);
  
  public void display() {
    noStroke();
    rectMode(CENTER);
    fill(textColor);
    textAlign(textAlignX, textAlignY);
    
    PFont currentFont = raleway;
    switch (font) {
      case BUNGEEHAIRLINE:
        currentFont = bungeeHairline;
      case BUNGEEINLINE:
        currentFont = bungeeInline;
      default:
        break;
    }
    textFont(currentFont, textSize);
    text(text, x, y);
  }
}
