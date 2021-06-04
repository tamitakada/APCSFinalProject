public class Upgrades implements View {
  private Car car;
  private ArrayList<Button> buttons;
  private CarPart[] carParts;
  private ArrayList<Label[]> labels;
  
  private boolean reload = true;

  public Upgrades(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
    labels = new ArrayList<Label[]>();
    carParts = car.getParts();
  }

  public void setUp() {
    Button backButton = new Button(100, 50, 70, 40, #1E1E1E);
    backButton.setLabel("< Back", 255, 20);
    buttons.add(backButton);

    for (int i = 0; i < 6; i++) {
      int[] xCors = {400, 620, 720};
      int yCor = 250 + 120 * i;
      if (i >= 3) {
        xCors = new int[]{780, 1000, 1100};
        yCor = 250 + 120 * (i - 3);
      }
      
      //Buttons
      Button up = new Button(xCors[2] + 20, yCor, 30, 30, #1E1E1E);
      up.setLabel("+", 255, 22);
      
      Button down = new Button(xCors[2] - 20, yCor, 30, 30, #1E1E1E);
      down.setLabel("-", 255, 22);
      
      buttons.add(up);
      buttons.add(down);
      
      //Labels
      Label name = new Label(xCors[0], yCor, carParts[i].getDisplayName());
      name.setSize(24);
      name.setFont(Font.RALEWAYBOLD);
      name.setAlignment(LEFT, CENTER);

      Label level = new Label(xCors[1], yCor, "Level");
      level.setSize(24);

      Label current = new Label(xCors[2], yCor, "" + (int) carParts[i].getLevel());
      current.setSize(24);
      
      labels.add(new Label[]{name, level, current});
    }
  }

  public void display() {
    background(#1E1E1E);
    car.display(200, 380, 187, 500, reload);
    reload = false;
    
    for (Button b: buttons) {
      b.display();
    }

    Label label = new Label(width/2 + 140, 120, "UPGRADES");
    label.setSize(65);
    label.setFont(Font.BUNGEEHAIRLINE);
    label.display();
    
    for (int i = 0; i < carParts.length; i++) {
      labels.get(i)[2].setText("" + (int) carParts[i].getLevel());
      for (Label l: labels.get(i)) {
        l.display();
      }
    }
  }

  public ArrayList<Button> getButtons() {
    return buttons;
  }

  public void clicked(int index) {
    if (index == 0) {
      current = new Home(car);
      newView = true;
    } else {
      boolean up = (index % 2 != 0);
      if (up) carParts[(index - 1) / 2].incLevel();
      else carParts[(index - 1) / 2].decLevel();
    }
  }
  
  public void upKeyPressed() {
    return;
  }
}
