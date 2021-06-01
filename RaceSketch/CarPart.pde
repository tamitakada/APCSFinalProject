public class CarPart {
  private double level;
  
  public CarPart() {
    level = 1;
  }
  
  public double weight() {
    return 0.0; 
  }
  
  public void incLevel() {
    if (level < 5) {
      level++;
    }
  }
  
  public void decLevel() {
    if (level > 1) {
      level--;
    }
  }
  
  public void setLevel(double level) {
    this.level = level;
  }
  
  public double getLevel() {
     return level;
  }
  
  public String getDisplayName() {
    return "";
  }
}
