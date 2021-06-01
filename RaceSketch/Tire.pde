public class Tire extends CarPart {
  public Tire() {
    super();
  }
  
  public Tire(double level) {
    super();
    setLevel(level);
  }
  
  public double grip() {
    return 100 + (50 * (getLevel() - 1));
  }
 
  public String getDisplayName() {
    return "Tires";
  }
}
