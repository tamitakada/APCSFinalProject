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
