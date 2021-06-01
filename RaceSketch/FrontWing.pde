public class FrontWing extends CarPart {
  public FrontWing() {
    super();
  }
  
  public FrontWing(double level) {
    super();
    setLevel(level);
  }
   
  public double aero() {
    return 2000 + (100 * (getLevel() - 1));
  }
  
  public double weight() {
    return 40 - (5 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Front Wing";
  }
}
