public class RearWing extends CarPart {
   
  public double aero() {
    return 2000 + (100 * (getLevel() - 1));
  }
  
  public double weight() {
    return 40 - (5 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Rear Wing";
  }
}
