public class Livery {
  private PImage img;
  private String imageName;
  private int cost;
  
  public Livery(String imageName) {
    this.imageName = imageName;
    cost = 8000;
  }
  
  public Livery(String imageName, int cost) {
    this.imageName = imageName;
    this.cost = cost;
  }
  
  public int getCost() {
    return cost; 
  }

  public PImage getImage(boolean reloadImg) {
      if (img == null || reloadImg) {
        img = loadImage(imageName);
      }
      return img;
  }
  
  public String getImageName() {
    return imageName; 
  }
}
