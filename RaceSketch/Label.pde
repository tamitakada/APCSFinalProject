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
  
  public void setText(String text) {
    this.text = text;
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
  
  public void display() {
    noStroke();
    fill(textColor);
    textAlign(textAlignX, textAlignY);
    
    PFont currentFont = fonts.raleway;
    switch (font) {
      case BUNGEEHAIRLINE:
        currentFont = fonts.bungeeHairline;
        break;
      case BUNGEEINLINE:
        currentFont = fonts.bungeeInline;
        break;
      case RALEWAYBOLD:
        currentFont = fonts.ralewayBold;
        break;
      default:
        break;
    }
    textFont(currentFont, textSize);
    text(text, x, y);
  }
}
