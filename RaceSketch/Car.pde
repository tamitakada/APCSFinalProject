public class Car {
  //Car properties
  private double power;
  private double grip;
  private double aero;
  private double weight;

  // private Gear gear;

  //Car appearance
  private Livery livery;

  //Car parts
  // private Tire tire;
  // private FrontWing frontWing;
  // private RearWing rearWing;
  // private Engine engine;
  // private Suspension suspension;
  // private Transmission transmission;

  public Car() {
    this.power = 0; this.grip = 0; this.aero = 0; this.weight = 0;
  }

  public Car(double power, double grip, double aero, double weight) {
    this.power = power; this.grip = grip;
    this.aero = aero; this.weight = weight;
  }

  public void move() {

  }

  public void shift() {

  }

  public void display(float x, float y) {
    PImage car = livery.getImage();
    image(car, x, y);
  }

  //Get methods
  public double getPower() {
    return power;
  }

  public double getGrip() {
    return grip;
  }

  public double getAero() {
    return aero;
  }

  public double getWeight() {
    return weight;
  }

  //Set methods for properties
  public void setPower(double power) {
    this.power = power;
  }

  public void setGrip(double grip) {
    this.grip = grip;
  }

  public void setAero(double aero) {
    this.aero = aero;
  }

  public void setWeight(double weight) {
    this.weight = weight;
  }

  //Set methods for parts
  /*
  public void setTire(Tire tire) {
    this.tire = tire;
  }

  public void setFrontWing(FrontWing frontWing) {
    this.frontWing = frontWing;
  }

  public void setRearWing(RearWing rearWing) {
    this.rearWing = rearWing;
  }

  public void setEngine(Engine engine) {
    this.engine = engine;
  }

  public void setSuspension(Suspension suspension) {
    this.suspension = suspension;
  }

  public void setTransmission(Transmission transmission) {
    this.transmission = transmission;
  }
  */
}
