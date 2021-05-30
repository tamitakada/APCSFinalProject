public class Race implements View {
  private Car car;
  private ArrayList<Button> buttons;
  private int light;
  
  public Race(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
    light = -1;
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
  }
  
  public ArrayList<Button> getButtons() {
    return buttons;
  }
  
  public void clicked(int index) {
    if (index == 0) {
      current = new Home();
      newView = true;
    }
    if (index == 1) {
      light = 0;
    }
  }
}
