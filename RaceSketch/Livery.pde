public class Livery {
  private String imageName;
  
  public Livery(String imageName) {
    this.imageName = imageName;
  }

  public PImage getImage() {
      return loadImage(imageName);
  }
}
