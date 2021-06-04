public class Button {
  private float x;
  private float y;
  private float rectWidth;
  private float rectHeight;
  private color rectColor;
  private int alpha;
  
  private String label;
  private color textColor;
  private int textSize;
  
  boolean isHidden = false;
  
  public Button(float x, float y, float rectWidth, float rectHeight, color rectColor) {
    this.x = x; this.y = y;
    this.rectWidth = rectWidth; this.rectHeight = rectHeight;
    this.rectColor = rectColor; alpha = 255;
    label = ""; textColor = 255; textSize = 20;
  }
  
  public void setRectColor(color col, int alpha) {
    rectColor = col; this.alpha = alpha;
  }
  
  public void setLabel(String text, color textColor, int size) {
    label = text;
    this.textColor = textColor;
    textSize = size;
  }
  
  public boolean click(float x, float y) {
    if (isHidden) return false;
    return Math.abs(this.x - x) <= rectWidth / 2 && Math.abs(this.y - y) <= rectHeight / 2;
  }
  
  public float[] getCenter() {
    return new float[]{x, y}; 
  }

  public void display() {
    if (!isHidden) {
      noStroke();
      fill(rectColor, alpha);
      rectMode(CENTER);
      rect(x, y, rectWidth, rectHeight, 100);
      fill(textColor);
      textAlign(CENTER, CENTER);
      textFont(fonts.raleway, textSize);
      text(label, x, y - 2, rectWidth, rectHeight);
    }
  }
}


////////////////////////////////////////


public class ImageButton extends Button {
  private String imageName;
  private float w; 
  private float h;
  private PImage img;

  public ImageButton(float x, float y, float w, float h, String imageName) {
    super(x, y, w, h, #1E1E1E);
    this.w = w; this.h = h;
    this.imageName = imageName;
  }

  public void display() {
    super.display();
    if (!isHidden) {
      if (img == null) img = loadImage(imageName);
      imageMode(CENTER);
  
      img.resize((int)w, (int)h);
      
      float[] center = super.getCenter();
      image(img, center[0], center[1]); 
    }
  }

  public String getImageName() {
    return imageName;
  }
}
