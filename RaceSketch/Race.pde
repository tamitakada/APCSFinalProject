public class Race implements View {
  private Car car;
  private ArrayList<Button> buttons;
  
  public Race(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
  }
  
  public void setUp() {
    Button backButton = new Button(100, 50, 70, 40, 0);
    backButton.setLabel("< Back", 255, 20);
    buttons.add(backButton);
  }
  
  public void display() {
    background(0);
    
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
