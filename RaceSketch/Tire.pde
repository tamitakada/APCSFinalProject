public class Tire extends CarParts {
  
  public double grip() {
    return 100 + (50 * (getLevel() - 1));
  }
  
}
