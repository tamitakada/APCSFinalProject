public class Transmission extends CarPart {
   
  public double power() {
    return 50 + (10 * (getLevel() - 1));
  }
  
  public double weight() {
    return 100 - (10 * (getLevel() - 1));
  }
  
}
