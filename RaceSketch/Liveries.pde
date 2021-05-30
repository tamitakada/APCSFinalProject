public class Liveries implements View {
  private Car car;
  private ArrayList<Button> buttons;
  
  private ArrayList<Livery> availableLiveries;

  public Liveries(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
    availableLiveries = new ArrayList<Livery>();
  }

  public void setUp() {
    Button backButton = new Button(100, 50, 70, 40, #1E1E1E);
    backButton.setLabel("< Back", 255, 20);
    buttons.add(backButton);
    
    String[] liveryList = {
      "red_purple_car.png",
      "cyan_yellow_car.png",
      "green_car.png",
      "white_blue_car.png",
      "purple_car.png"
    };
    
    for (String s: liveryList) {
      Livery livery = new Livery(s);
      availableLiveries.add(livery);
    }
  }

  public void display() {
    background(#1E1E1E);
    
    for (Button b: buttons) {
      b.display();
    }
    
    for (int i = 0; i < availableLiveries.size(); i++) {
      PImage livery = availableLiveries.get(i).getImage();
      livery.resize(112, 300);
      image(livery, 100 + i * 220, 300);
    }
  }

  public ArrayList<Button> getButtons() {
    return buttons;
  }

  public void clicked(int index) {
    if (index == 0) {
      current = new Home(car);
      newView = true;
    }
  }
}
