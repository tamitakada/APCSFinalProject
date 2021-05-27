public class Transmission extends CarParts {
   
  public double power() {
    return 50 + (10 * (getLevel() - 1));
  }
  
  public double weight() {
    return 100 - (10 * (getLevel() - 1));
  }
  
}
