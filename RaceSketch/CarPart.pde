public class CarPart {
  private double level;
  
  public CarPart() {
    level = 1;
  }
  
  public double weight() {
    return 0.0; 
  }
  
  public void incLevel() {
    level++;
  }
  
  public void decLevel() {
    if (level > 1) {
      level--;
    }
  }
  
  public double getLevel() {
     return level;
  }
  
  public String getDisplayName() {
    return "";
  }
}
