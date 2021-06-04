import java.text.DecimalFormat;

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
    else comp.setLivery(new Livery("enemy_green.png"));

    buttons = new ArrayList<Button>();
    weather = new Weather();
    light = -1;
    moveCar = 0;
    moveComp = 0;
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
    
    DecimalFormat f = new DecimalFormat("0.0");
    Label weatherLabel = new Label(
      900, 
      height - 70, 
      "Forecast: " + weather.getWeatherType() + "\nTemperature: " + f.format(weather.getTemp()) + " F\nWind speed: " + f.format(weather.getWindSpd()) + " m/s\nWind direction: " + f.format(weather.getWindDir()) + " degrees"
    );
    weatherLabel.setSize(18);
    weatherLabel.setAlignment(LEFT, CENTER);
    weatherLabel.display();

    //display and move the cars
    translate(width/2,height/2);
    rotate(radians(90));

    if (light == 5) {
      if (startTime == 0) {
        startTime = millis();
      }

      //calculate time for the cars
      if (moveCar < 1072 && moveComp < 1072) {
        moveCar = (float)  (Math.pow(moveCar,1.001) + car.move());
        carTime = millis() - startTime;

        moveComp = (float) (Math.pow(moveComp,1.001) + comp.move());
        compTime = millis() - startTime;

        car.display(115,550-moveCar,37,100,false);
        comp.display(-115,550-moveComp,37,100,false);

        //display the times for the cars
        //rotate(radians(-90));

        

        
      } else {
        car.display(115,550-moveCar,37,100,false);
        comp.display(-115,550-moveComp,37,100,false);

        rotate(radians(-90));
        translate(-width/2,-height/2);

        rectMode(CENTER);
        fill(#1E1E1E);

        PImage toShow = win;
        if (moveCar < 1072) {
          toShow = loss;
          rect(width/2, height/2, 540, 150);
        } else {
          rect(width/2, height/2, 450, 150);
        }

        imageMode(CENTER);
        image(toShow, width/2, height/2);
        
        if (toShow == win) {
          Label displayCarTime = new Label(1000, 520, "Your Time: " + String.valueOf(carTime/1000.0) + "s");
        displayCarTime.setSize(30);
        displayCarTime.setFont(Font.RALEWAYBOLD);
        displayCarTime.display();
        } else {
          Label displayCompTime = new Label(1000, 170, "Opponent Time: " + String.valueOf(compTime/1000.0) + "s");
        displayCompTime.setSize(30);
        displayCompTime.setFont(Font.RALEWAYBOLD);
        displayCompTime.display();
        }
      }
    } else {
      car.display(115,550,37,100,reload);
      comp.display(-115,550,37,100,false);
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
      weather = new Weather();
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
