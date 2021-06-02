public class Race implements View, WeatherDelegate {
  private Car car;
  private Car comp;
  private ArrayList<Button> buttons;
  private int light;
  private float moveCar;
  private float moveComp;
  private float carTime;
  private float compTime;
  private int startTime;

  private PImage bg;
  
  private PImage loss;
  private PImage win;
  
  private boolean reload = true;
  
  private Weather weather;

  public Race(Car car) {
    this.car = car;
    car.delegate = this;
    
    comp = car.clone();
    comp.delegate = this;
    
    double compLivery = Math.random();
    if (compLivery >= 0.5) comp.setLivery(new Livery("enemy_red.png"));
    else comp.setLivery(new Livery("enemy_black.png"));
    
    buttons = new ArrayList<Button>();
    weather = new Weather();
    light = -1;
    moveCar = (float)(550 -  car.move()/50);
    moveComp = (float)(550 - comp.move()/50);
    carTime = 0;
    compTime = 0;
    startTime = 0;
  }

  public void setUp() {
    Button backButton = new Button(100, 50, 70, 40, #1E1E1E);
    backButton.setLabel("< Back", 255, 20);
    Button startButton = new Button(1100, 50, 70, 40, #1E1E1E);
    startButton.setLabel("Start", 255,20);
    Button resetButton = new Button(900, 50, 70, 40, #1E1E1E);
    resetButton.setLabel("Reset", 255,20);
    buttons.add(backButton);
    buttons.add(startButton);
    buttons.add(resetButton);
    bg = loadImage("raceBG.png");
    loss = loadImage("lose_label.png");
    win = loadImage("win_label.png");
  }

  public void display() {
    background(bg);

    //display the buttons
    for (Button b: buttons) {
      b.display();
    }

    //display the lights for the dountdown
    if (light >= 0) {
      if (light < 5) {
        fill(#FBFF00);
        ellipse(157.78-light*29.14,311.3,22.6,22.6);
        ellipse(157.78-light*29.14,387.01,22.6,22.6);
        delay(1000);
        light++;
      }
    }
    if (light == 5) {
      fill(#04FF00);
      ellipse(157.78-4*29.14,311.3,22.6,22.6);
      ellipse(157.78-4*29.14,387.01,22.6,22.6);
    }

    //display and move the cars
    translate(width/2,height/2);
    rotate(radians(90));

    if (light == 5) {
      if (startTime == 0) {
        startTime = millis();
      }
      
      //calculate time for the cars
      if (moveCar > -550 && moveComp > -550) {
        moveCar -= (float) car.move()/50;
        carTime = millis() - startTime;
        
        moveComp -= (float) comp.move()/50;
        compTime = millis() - startTime;
        
        car.display(115,moveCar,37,100,false);
        comp.display(-115,moveComp,37,100,false);
        
        //display the times for the cars
        rotate(radians(-90));
        
        Label displayCarTime = new Label(475, 175, String.valueOf(carTime/1000.0));
        displayCarTime.setSize(30);
        displayCarTime.setFont(Font.RALEWAYBOLD);
        displayCarTime.display();
        
        Label displayCompTime = new Label(475, -175, String.valueOf(compTime/1000.0));
        displayCompTime.setSize(30);
        displayCompTime.setFont(Font.RALEWAYBOLD);
        displayCompTime.display();
      } else {
        car.display(115,moveCar,37,100,false);
        comp.display(-115,moveComp,37,100,false);
        
        rotate(radians(-90));
        translate(-width/2,-height/2);
        
        rectMode(CENTER);
        fill(#1E1E1E);
        rect(width/2, height/2, 540, 150);

        PImage toShow = win;
        if (moveCar > -550) toShow = loss; 
        
        imageMode(CENTER);
        image(toShow, width/2, height/2);
      }
    } else {
      car.display(115,moveCar,37,100,reload);
      comp.display(-115,moveComp,37,100,false);
      reload = false;
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
      light = 0;
    } else if (index == 2) {
      light = -1;
      moveCar = (float)(550 -  car.move()/50);
      moveComp = (float)(550 - comp.move()/50);
      carTime = 0;
      compTime = 0;
      startTime = 0;
    }
  }
  
  public Weather getWeather() {
    return weather;
  }
}
