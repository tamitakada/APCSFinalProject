public class Upgrades implements View {
  private Car car;
  private ArrayList<Button> buttons;
  
  public Upgrades(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
  }
  
  public void setUp() {
    background(0);
    car.display(100, 100);
    
    Button backButton = new Button(100, 50, 70, 40, 255);
    backButton.setLabel("< Back", 0, 16);
    buttons.add(backButton);
  }
  
  public void display() {
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
  }
}
