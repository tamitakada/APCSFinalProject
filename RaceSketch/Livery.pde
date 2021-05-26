public class Livery {
  private String imageName;

  public PImage getImage() {
      return loadImage(imageName);
  }
}
