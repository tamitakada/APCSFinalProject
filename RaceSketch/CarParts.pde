public class CarParts {
 
  private double level;
  
  public CarParts() {
    level = 0;
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
  
  public double getVal() {
    return 650;
  }
  
}
