public class Livery {
  private PImage img;
  private String imageName;
  
  public Livery(String imageName) {
    this.imageName = imageName;
  }

  public PImage getImage() {
      if (img == null) {
        img = loadImage(imageName);
      }
      return img;
  }
}
