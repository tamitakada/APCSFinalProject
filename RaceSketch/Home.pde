public class Home implements View {
  private ArrayList<Button> buttons;
  private ArrayList<View> views;
  private Car car;
  
  private PImage bg;

  public Home(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
    views = new ArrayList<View>();
    views.add(new Race(car));
    views.add(new Upgrades(car));
    views.add(new Liveries(car));
  }
  
  public void setUp() {
    String[] buttonTitles = {"Race", "Upgrades", "Liveries"};
    for (int i = 0; i < buttonTitles.length; i++) {
      Button button = new Button(width/2, 310 + 110 * i, 200, 70, 255);
      button.setLabel(buttonTitles[i], 0, 20);
      button.setRectColor(255, 191);
      buttons.add(button);
    }
    bg = loadImage("homeBG.png");
  }
  
  public void display() {
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
  
  public void keyClicked(int code) {
    return;
  }
}
