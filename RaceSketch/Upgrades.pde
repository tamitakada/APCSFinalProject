public class Upgrades implements View {
  private Car car;
  private ArrayList<Button> buttons;
  private CarPart[] carParts;
  
  public Upgrades(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
    carParts = car.getParts();
  }
  
  public void setUp() {
    background(0);
    car.display(100, 100);
    
    Button backButton = new Button(100, 50, 70, 40, 0);
    backButton.setLabel("< Back", 255, 16);
    buttons.add(backButton);
  }
  
  public void display() {
    for (Button b: buttons) {
      b.display();
    }
    
    Label label = new Label(width/2 + 100, 120, "UPGRADES");
    label.setSize(65);
    label.setFont(Font.BUNGEEHAIRLINE);
    label.display();
    
    for (int i = 0; i < 6; i++) {
      int[] xCors = {400, 620, 670};
      int yCor = 250 + 120 * i;
      if (i >= 3) {
        xCors = new int[]{780, 1000, 1050};
        yCor = 250 + 120 * (i - 3);
      }
      Label name = new Label(xCors[0], yCor, carParts[i].getDisplayName());
      name.setSize(24);
      name.setAlignment(LEFT, CENTER);
      name.display();
      
      Label level = new Label(xCors[1], yCor, "Level");
      level.setSize(24);
      level.display();
      
      Label current = new Label(xCors[2], yCor, "" + (int) carParts[i].getLevel());
      current.setSize(24);
      current.display();
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
