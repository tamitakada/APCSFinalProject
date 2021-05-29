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
  private Tire tire;
  private FrontWing frontWing;
  private RearWing rearWing;
  private Engine engine;
  private Suspension suspension;
  private Transmission transmission;

  public Car() {
    this.power = 0; this.grip = 0; this.aero = 0; this.weight = 0;
    livery = new Livery("defaultCar.png");
    
    tire = new Tire();
    frontWing = new FrontWing();
    rearWing = new RearWing();
    engine = new Engine();
    suspension = new Suspension();
    transmission = new Transmission();
  }

  public Car(double power, double grip, double aero, double weight) {
    this.power = power; this.grip = grip;
    this.aero = aero; this.weight = weight;
    livery = new Livery("defaultCar.png");
    
    tire = new Tire();
    frontWing = new FrontWing();
    rearWing = new RearWing();
    engine = new Engine();
    suspension = new Suspension();
    transmission = new Transmission();
  }

  //Meters per second (avg ~105m/s)
  public double move() {
    calculateWeight(); calculatePower(); calculateGrip(); calculateAero();
    double[] properties = {power, grip, aero};
    for (int i = 0; i < properties.length; i++) {
      double luck = Math.random() * 100;
      double current = properties[i];
      if (luck >= 97) current *= 2;
      else if (luck >= 90) current *= 1.5;
      else if (luck >= 50) current *= 1.2;
      else if (luck <= 10) current *= 0.8;
      properties[i] = current;
    }
    return (properties[0] + properties[1] + properties[2] - getWeight()) / 60;
  }

  public void shift() {

  }
  
  public CarPart[] getParts() {
    return new CarPart[]{tire, frontWing, rearWing, engine, suspension, transmission};
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
  public void setTire(Tire tire) {
    this.tire = tire;
    calculateWeight();
    calculateGrip();
  }

  public void setFrontWing(FrontWing frontWing) {
    this.frontWing = frontWing;
    calculateWeight();
    calculateAero();
  }

  public void setRearWing(RearWing rearWing) {
    this.rearWing = rearWing;
    calculateWeight();
    calculateAero();
  }

  public void setEngine(Engine engine) {
    this.engine = engine;
    calculatePower();
    calculateWeight();
    calculateAero();
  }

  public void setSuspension(Suspension suspension) {
    this.suspension = suspension;
    calculateWeight();
    calculateAero();
  }

  public void setTransmission(Transmission transmission) {
    this.transmission = transmission;
    calculatePower();
    calculateWeight();
  }
  
  private void calculatePower() {
    double totalPower = engine.power() + transmission.power();
    setPower(totalPower);
  }
  
  private void calculateAero() {
    double total = engine.aero() + frontWing.aero() + rearWing.aero() + suspension.aero();
    setAero(total);
  }
  
  private void calculateGrip() {
    setGrip(tire.grip());
  }
  
  private void calculateWeight() {
    double total = 0;
    for (CarPart p: getParts()) {
      total += p.weight();
    }
    setWeight(total);
  }
}
