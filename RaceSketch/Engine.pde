public class Engine extends CarPart {
  public Engine() {
    super();
  }
  
  public Engine(double level) {
    super();
    setLevel(level);
  }
  
  public double power() {
    return 800 + (50 * (getLevel() - 1));
  }
  
  public double aero() {
    return 100 + (100 * (getLevel() - 1));
  }
  
  public double weight() {
    return 400 - (20 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Engine";
  }
}
