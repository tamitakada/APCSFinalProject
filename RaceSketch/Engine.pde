public class Engine extends CarParts {
  
  public double power() {
    return 800 + (50 * getLevel());
  }
  
  public double aero() {
    return 100 + (100 * getLevel());
  }
  
  public double weight() {
    return 400 - (20 * getLevel());
  }
  
}
