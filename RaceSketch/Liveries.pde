public class Liveries implements View {
  private Car car;
  private ArrayList<Button> buttons;
  private Livery[][] liveryList = {
    {
      new Livery("red_purple_car.png", 8000),
      new Livery("green_car.png", 8000),
      new Livery("cyan_yellow_car.png", 10000),
      new Livery("white_blue_car.png", 15000),
      new Livery("purple_car.png", 15000)
    },
    {
      new Livery("salmon_car.png", 15000),
      new Livery("yellow_blue_car.png", 20000),
      new Livery("blue_car.png", 20000),
      new Livery("orange_car.png", 25000),
      new Livery("pink_blue_car.png", 50000),
    }
  };
  private int currentPage;
  private boolean reload = true;

  public Liveries(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
    currentPage = 0;
  }
  
  private ArrayList<Label> prices = new ArrayList<Label>();

  public void setUp() {
    Button backButton = new Button(100, 50, 70, 40, #1E1E1E);
    backButton.setLabel("< Back", 255, 20);
    buttons.add(backButton);

    buttons.add(new ImageButton(1130, 450, 20, 40, "rightArrow.png"));
    buttons.add(new ImageButton(50, 450, 20, 40, "leftArrow.png"));
    buttons.get(2).isHidden = true;

    for (int i = 0; i < liveryList[0].length; i++) {
      ImageButton livery = new ImageButton(
        150 + i * 220, // x
        450, // y
        112, // width
        300, // height
        liveryList[0][i].getImageName()
      );
      buttons.add(livery);
      
      Label priceTag = new Label(150 + i * 220, height - 70, "" + liveryList[0][i].getCost());
      priceTag.setSize(22);
      prices.add(priceTag);
    }
  }

  public void display() {
    background(#1E1E1E);

    rotate(-PI/2);
    car.display(-150, 380, 112, 300, reload);
    reload = false;
    rotate(PI/2);

    Label label = new Label(900, 140, "LIVERIES");
    label.setSize(65);
    label.setFont(Font.BUNGEEHAIRLINE);
    label.display();
    
    Label pointsDisplay = new Label(width - 130, 50, "" + Records.points + " points");
    pointsDisplay.setFont(Font.RALEWAYBOLD);
    pointsDisplay.display();

    for (Button b: buttons) {
      b.display();
    }
    
    for (Label l: prices) {
      l.display(); 
    }
  }

  public ArrayList<Button> getButtons() {
    return buttons;
  }

  public void clicked(int index) {
    if (index == 0) {
      current = new Home(car);
      newView = true;
    } else if (index < 3) {
      if (index == 1) currentPage++;
      else currentPage--;

      for (int i = 4; i >= 0; i--) {
        buttons.remove(i + 3);
        prices.remove(i);
      }
      for (int i = 0; i < liveryList[currentPage].length; i++) {
        ImageButton livery = new ImageButton(
          150 + i * 220, // x
          450, // y
          112, // width
          300, // height
          liveryList[currentPage][i].getImageName()
        );
        buttons.add(livery);
        
        Label priceTag = new Label(150 + i * 220, height - 70, "" + liveryList[currentPage][i].getCost());
        priceTag.setSize(22);
        priceTag.isHidden = Records.liveries.contains(liveryList[currentPage][i]);
        prices.add(priceTag);
      }
      buttons.get(1).isHidden = (currentPage == liveryList.length - 1);
      buttons.get(2).isHidden = (currentPage == 0);
    } else {
      Livery livery = liveryList[currentPage][index - 3];
      if (!Records.liveries.contains(livery)) {
        if (Records.points >= 8000) {
          Records.points -= 8000;
          Records.liveries.add(livery); 
          car.setLivery(livery);
          prices.get(index - 3).isHidden = true;
        }
      } else {
        car.setLivery(livery); 
      }
    }
  }

  public void keyClicked(int code) {
    return;
  }
}
