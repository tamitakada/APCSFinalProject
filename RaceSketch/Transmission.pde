public class Transmission extends CarPart {
  public Transmission() {
    super();
  }
  
  public Transmission(double level) {
    super();
    setLevel(level);
  }
   
  public double power() {
    return 50 + (10 * (getLevel() - 1));
  }
  
  public double weight() {
    return 100 - (10 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Transmission";
  }
}
