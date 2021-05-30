public class Race implements View {
  private Car car;
  private ArrayList<Button> buttons;
  private int[] light;
  
  public Race(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
    light = new int[5];
  }
  
  public void setUp() {
    Button backButton = new Button(100, 50, 70, 40, 0);
    backButton.setLabel("< Back", 255, 20);
    Button startButton = new Button(1100, 50, 70, 40, 0);
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
      for (int i = 0; i < light.length; i++) {
        light[i] = 1+1;
      }
    }
  }
}
