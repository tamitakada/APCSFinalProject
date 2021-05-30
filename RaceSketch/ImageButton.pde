public class ImageButton extends Button {
  private PImage image;
  float x; float y;
  
  public ImageButton(float x, float y, PImage image) {
    super(x, y, image.width, image.height, 0);
    this.image = image;
  }
  
  public void display() {
    rectMode(CENTER);
    image(image, x, y);
  }
}
