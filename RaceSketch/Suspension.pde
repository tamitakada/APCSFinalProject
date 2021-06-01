public class Suspension extends CarPart {
  public Suspension() {
    super();
  }
  
  public Suspension(double level) {
    super();
    setLevel(level);
  }
   
  public double aero() {
    return 1000 + (100 * (getLevel() - 1));
  }
  
  public double weight() {
    return 100 - (10 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Suspension";
  }
}
