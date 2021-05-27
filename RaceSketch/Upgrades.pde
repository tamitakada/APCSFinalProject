public class Upgrades implements View {
  private Car car;
  
  public Upgrades(Car car) {
    this.car = car;
  }
  
  public void display() {
    background(0);
    car.display(100, 100);
  }
}
