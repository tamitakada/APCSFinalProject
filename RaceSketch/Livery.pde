public class Livery {
  private PImage img;
  private String imageName;
  
  public Livery(String imageName) {
    this.imageName = imageName;
  }

  public PImage getImage(boolean reloadImg) {
      if (img == null || reloadImg) {
        img = loadImage(imageName);
      }
      return img;
  }
}
