public class Upgrades implements View {
  private Car car;
  
  public Upgrades(Car car) {
    this.car = car;
  }
  
  public void setUp() {
  }
  
  public void display() {
    background(0);
    car.display(100, 100);
  }
  
  public ArrayList<Button> getButtons() {
    return new ArrayList<Button>();
  }
  
  public void clicked(int index) {
  }
}
