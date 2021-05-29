public class Home implements View {
  private ArrayList<Button> buttons;
  private ArrayList<View> views;
  private Car car;

  public Home() {
    car = new Car();
    buttons = new ArrayList<Button>();
    views = new ArrayList<View>();
    Upgrades upgradesView = new Upgrades(car);
    Race raceView = new Race(car);
    views.add(raceView);
    views.add(upgradesView);
  }
  
  public void setUp() {
    String[] buttonTitles = {"Race", "Upgrades", "Liveries"};
    for (int i = 0; i < buttonTitles.length; i++) {
      Button button = new Button(width/2, 310 + 110 * i, 200, 70, 255);
      button.setLabel(buttonTitles[i], 0, 20);
      button.setRectColor(255, 191);
      buttons.add(button);
    }
  }
  
  public void display() {
    PImage bg = loadImage("homeBG.png");
    background(bg);
    
    for (Button b: buttons) {
      b.display();
    }
    
    Label label = new Label(width/2, 140, "NEON RACER");
    label.setSize(80);
    label.setColor(#FF00C7);
    label.setFont(Font.BUNGEEINLINE);
    label.display();
  }
  
  public void clicked(int index) {
    if (index < views.size()) {
      current = views.get(index);
      newView = true; 
    }
  }
  
  public ArrayList<Button> getButtons() {
    return buttons; 
  }
}
