public class Liveries implements View {
  private Car car;
  private ArrayList<Button> buttons;
  private String[][] liveryList = {
    {
      "red_purple_car.png",
      "cyan_yellow_car.png",
      "green_car.png",
      "white_blue_car.png",
      "purple_car.png"
    },
    {
      "pink_blue_car.png",
      "yellow_blue_car.png",
      "blue_car.png",
      "orange_car.png",
      "salmon_car.png"
    }
  };
  private int currentPage;

  public Liveries(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
    currentPage = 0;
  }

  public void setUp() {
    Button backButton = new Button(100, 50, 70, 40, #1E1E1E);
    backButton.setLabel("< Back", 255, 20);
    buttons.add(backButton);
    
    buttons.add(new ImageButton(1100, 450, 20, 40, "rightArrow.png"));
    
    for (int i = 0; i < liveryList[0].length; i++) {
      ImageButton livery = new ImageButton(
        150 + i * 220, // x
        450, // y
        112, // width
        300, // height
        liveryList[0][i]
      );
      buttons.add(livery);
    }
  }

  public void display() {
    background(#1E1E1E);
    
    rotate(-PI/2);
    car.display(-150, 380, 112, 300);
    rotate(PI/2);
    
    Label label = new Label(900, 140, "LIVERIES");
    label.setSize(65);
    label.setFont(Font.BUNGEEHAIRLINE);
    label.display();
    
    for (Button b: buttons) {
      b.display();
    }
  }

  public ArrayList<Button> getButtons() {
    return buttons;
  }

  public void clicked(int index) {
    if (index == 0) {
      current = new Home(car);
      newView = true;
    } else if (index == 1) {
      currentPage++;
      for (int i = 4; i >= 0; i--) {
        buttons.remove(i + 2);
      }
      for (int i = 0; i < liveryList[currentPage].length; i++) {
        ImageButton livery = new ImageButton(
          150 + i * 220, // x
          450, // y
          112, // width
          300, // height
          liveryList[currentPage][i]
        );
        buttons.add(livery);
      }
    } else {
      Livery livery = new Livery(liveryList[currentPage][index - 2]);
      car.setLivery(livery); 
    }
  }
}
