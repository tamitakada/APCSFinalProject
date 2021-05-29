public class Tire extends CarPart {
  
  public double grip() {
    return 100 + (50 * (getLevel() - 1));
  }
 
  public String getDisplayName() {
    return "Tires";
  }
}
