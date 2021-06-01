public class Race implements View {
  private Car car;
  private Car comp;
  private ArrayList<Button> buttons;
  private int light;
  private float moveCar;
  private float moveComp;
  private float carTime;
  private float compTime;
  private int startTime;
  
  public Race(Car car) {
    this.car = car;
    comp = car;
    buttons = new ArrayList<Button>();
    light = -1;
    moveCar = (float) (550 -  car.move()/15);
    moveComp = (float) (550 - comp.move()/15);
    carTime = 0;
    compTime = 0;
    startTime = 0;
  }
  
  public void setUp() {
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
    
    //display the buttons
    for (Button b: buttons) {
      b.display();
    }
    
    //display the lights for the dountdown
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
    
    //display and move the cars
    translate(width/2,height/2);
    rotate(radians(90));
    
    if (light == 5) {
      car.display(115,moveCar,37,100);
      comp.display(-115,moveComp,37,100);
      moveCar -= (float) car.move()/15;
      moveComp -= (float) comp.move()/15;
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
    
    //display the times for the cars
    rotate(radians(-90));
    Label displayCarTime = new Label(475, 175, String.valueOf(carTime/15));
    displayCarTime.setSize(30);
    displayCarTime.setFont(Font.BUNGEEHAIRLINE);
    displayCarTime.display();
    Label displayCompTime = new Label(475, -175, String.valueOf(compTime/15));
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
