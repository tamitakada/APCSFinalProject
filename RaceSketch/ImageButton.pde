public class ImageButton extends Button {
  private String imageName;
  private float w; 
  private float h;

  public ImageButton(float x, float y, float w, float h, String imageName) {
    super(x, y, w, h, 0);
    this.w = w; this.h = h;
    this.imageName = imageName;
  }

  public void display() {
    super.display();
    
    rectMode(CENTER);
    
    PImage img = loadImage(imageName);
    img.resize((int)w, (int)h);
    
    float[] center = super.getCenter();
    image(img, center[0], center[1]);
  }

  public String getImageName() {
    return imageName;
  }
}
