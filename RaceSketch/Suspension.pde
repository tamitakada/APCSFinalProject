public class Suspension extends CarParts {
   
  public double aero() {
    return 1000 + (100 * (getLevel() - 1));
  }
  
  public double weight() {
    return 100 - (10 * (getLevel() - 1));
  }
  
}
