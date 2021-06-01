public class Race implements View {
  private Car car;
  private Car comp;
  private ArrayList<Button> buttons;
  private int light;
  private double moveCar;
  private double moveComp;
  private double carTime;
  private double compTime;
  private Weather currentWeather;
  
  public Race(Car car) {
    this.car = car;
    comp = car;
    buttons = new ArrayList<Button>();
    currentWeather = new Weather();
    light = -1;
    moveCar = (550 -  car.move()/15);
    moveComp = (550 - comp.move()/15);
    carTime = 0;
    compTime = 0;
  }
  
  public void setUp() {
    frameRate(15);
    Button backButton = new Button(100, 50, 70, 40, #1E1E1E);
    backButton.setLabel("< Back", 255, 20);
    Button startButton = new Button(1100, 50, 70, 40, #1E1E1E);
    startButton.setLabel("Start", 255,20);
    buttons.add(backButton);
    buttons.add(startButton);
  }
  
  public void display() {
    PImage bg = loadImage("raceBG.png");
    background(bg);

    for (Button b: buttons) {
      b.display();
    }
    
    if (light >= 0) {
      if (light < 5) {
          fill(#FBFF00);
          ellipse(157.78-light*29.14,311.3,22.6,22.6);
          ellipse(157.78-light*29.14,387.01,22.6,22.6);
          delay(1000);
          light++;
      }
    }
    if (light == 5) {
      fill(#04FF00);
      ellipse(157.78-4*29.14,311.3,22.6,22.6);
      ellipse(157.78-4*29.14,387.01,22.6,22.6);
    }
    
    translate(width/2,height/2);
    rotate(radians(90));
    
    if (light == 5) {
      car.display(115,(float)moveCar,37,100);
      comp.display(-115,(float)moveComp,37,100);
      moveCar -= car.move()/15;
      moveComp -= comp.move()/15;
      if (moveComp > -550) {
        compTime++;
      }
      if (moveCar > -550) {
        carTime++;
      }
      
    } 
    else {
      car.display(115,550,37,100);
      comp.display(-115,550,37,100);
    }
    
    rotate(radians(-90));
    
    println(carTime);
    double roundedCarTime = Math.round(carTime * 100.0) / 100.0;
    println(roundedCarTime);
    println();
    
    Label displayCarTime = new Label(475, 175, String.valueOf(roundedCarTime));
    displayCarTime.setSize(30);
    displayCarTime.setFont(Font.BUNGEEHAIRLINE);
    displayCarTime.display();
    
    double roundedCompTime = Math.round(compTime * 100.0) / 100.0;
    
    Label displayCompTime = new Label(475, -175, String.valueOf(roundedCompTime));
    displayCompTime.setSize(30);
    displayCompTime.setFont(Font.BUNGEEHAIRLINE);
    displayCompTime.display();
  }
  
  public ArrayList<Button> getButtons() {
    return buttons;
  }
  
  public void clicked(int index) {
    if (index == 0) {
      current = new Home(car);
      newView = true;
    } else if (index == 1) {
      light = 0;
    }
  }
}
