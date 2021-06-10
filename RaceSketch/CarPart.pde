public class CarPart {
  private double level;
  
  public CarPart() {
    level = 1;
  }
  
  public int getCost() {
    if (getLevel() < 5) return (int) getLevel() * 1000;
    return 0;
  }
  
  public double weight() {
    return 0.0; 
  }
  
  public void incLevel() {
    if (level < 5) {
      level++;
    }
  }
  
  public void decLevel() {
    if (level > 1) {
      level--;
    }
  }
  
  public void setLevel(double level) {
    this.level = level;
  }
  
  public double getLevel() {
     return level;
  }
  
  public String getDisplayName() {
    return "";
  }
}


////////////////////////////////////////


public class Engine extends CarPart {
  public Engine() {
    super();
  }
  
  public Engine(double level) {
    super();
    setLevel(level);
  }
  
  public double power() {
    return 80 + (5 * (getLevel() - 1));
  }
  
  public double aero() {
    return 10 + (10 * (getLevel() - 1));
  }
  
  public double weight() {
    return 40 - (2 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Engine";
  }
}


////////////////////////////////////////


public class FrontWing extends CarPart {
  public FrontWing() {
    super();
  }
  
  public FrontWing(double level) {
    super();
    setLevel(level);
  }
   
  public double aero() {
    return 200 + (10 * (getLevel() - 1));
  }
  
  public double weight() {
    return 4 - (0.5 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Front Wing";
  }
}


////////////////////////////////////////


public class RearWing extends CarPart {
  public RearWing() {
    super();
  }
  
  public RearWing(double level) {
    super();
    setLevel(level);
  }
   
  public double aero() {
    return 200 + (10 * (getLevel() - 1));
  }
  
  public double weight() {
    return 4 - (0.5 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Rear Wing";
  }
}


////////////////////////////////////////


public class Suspension extends CarPart {
  public Suspension() {
    super();
  }
  
  public Suspension(double level) {
    super();
    setLevel(level);
  }
   
  public double aero() {
    return 100 + (10 * (getLevel() - 1));
  }
  
  public double weight() {
    return 10 - (1 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Suspension";
  }
}


////////////////////////////////////////


public class Tire extends CarPart {
  public Tire() {
    super();
  }
  
  public Tire(double level) {
    super();
    setLevel(level);
  }
  
  public double grip() {
    return 10 + (5 * (getLevel() - 1));
  }
 
  public String getDisplayName() {
    return "Tires";
  }
}


////////////////////////////////////////


public class Transmission extends CarPart {
  public Transmission() {
    super();
  }
  
  public Transmission(double level) {
    super();
    setLevel(level);
  }
   
  public double power() {
    return 5 + (1 * (getLevel() - 1));
  }
  
  public double weight() {
    return 10 - (1 * (getLevel() - 1));
  }
  
  public String getDisplayName() {
    return "Transmission";
  }
}
