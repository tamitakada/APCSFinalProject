public class Car implements Cloneable {
  //Car properties
  private double power;
  private double grip;
  private double aero;
  private double weight;

  private int gear;
  private int rpm;
  
  //Car appearance
  private Livery livery;

  //Car parts
  private Tire tire;
  private FrontWing frontWing;
  private RearWing rearWing;
  private Engine engine;
  private Suspension suspension;
  private Transmission transmission;

  public WeatherDelegate delegate;

  public Car() {
    this.power = 0; this.grip = 0; this.aero = 0; this.weight = 0;
    livery = new Livery("defaultCar.png");

    tire = new Tire();
    frontWing = new FrontWing();
    rearWing = new RearWing();
    engine = new Engine();
    suspension = new Suspension();
    transmission = new Transmission();
    
    gear = 0;
    rpm = 0;
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

    Weather weather = delegate.getWeather();
    if (weather.getWeatherType() == WeatherType.RAINY) {
      properties[1] -= Math.random() * 40 + 10;
    }

    double temp = weather.getTemp();
    if (temp <= 32) {
      properties[0] -= ((33 - temp) * (Math.random() * 3 + 2)) + 50;
    } else if (temp >= 80) {
      properties[0] -= ((temp - 79) * (Math.random() * 3 + 2)) + 50;
    }

    properties[2] += weather.getWindSpd() * cos(radians(weather.getWindDir())) * 50;

    return (properties[0] + properties[1] + properties[2] - getWeight()) / 1000;
  }

  public void incGear() {
    if (gear < 6) {
      gear++;
    }
    setRpm(1000*gear);
  }
  
  public void decGear() {
    if (gear > 1) {
      gear--;
    }
    setRpm(1000*gear);
  }
  
  public void setGear(int g) {
    gear = 0;
  }
  
  public void setRpm(int n){
    rpm = n;
  }
  
  public int getRpm() {
    return rpm;
  }
  
  public int getGear() {
    return gear;
  }

  public double getAcceleration() {
    if (gear == 0) {
      return 0;
    } 
    return 1.001 + ((7 - gear) * .0001);
  }

  public CarPart[] getParts() {
    return new CarPart[]{tire, frontWing, rearWing, engine, suspension, transmission};
  }

  public void display(float x, float y, int w, int h, boolean reload) {
    imageMode(CENTER);
    PImage car = livery.getImage(reload);
    car.resize(w, h);
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

  public void setLivery(Livery livery) {
    this.livery = livery;
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

  public Car clone() {
    Car copy = new Car(getPower(), getGrip(), getAero(), getWeight());
    copy.setTire(new Tire(tire.getLevel()));
    copy.setFrontWing(new FrontWing(frontWing.getLevel()));
    copy.setRearWing(new RearWing(rearWing.getLevel()));
    copy.setEngine(new Engine(engine.getLevel()));
    copy.setSuspension(new Suspension(suspension.getLevel()));
    copy.setTransmission(new Transmission(transmission.getLevel()));
    return copy;
  }
}
