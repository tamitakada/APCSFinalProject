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

  private PImage loss;
  private PImage win;
  private boolean addedPoints = false;
  private boolean resetWeather = false;

  private boolean reload = true;
  private boolean white = true;

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

    loss = loadImage("lose_label.png");
    win = loadImage("win_label.png");
  }

  public void display() {
    background(#1E1E1E);

    boolean showEnd = false;
    if (light == 5) {
      if (startTime == 0) startTime = millis();

      // calculate time and move cars
      if (moveCar < 2500 && moveComp < 2500) {
        if (car.getRpm() > 9999) moveCar += car.move();
        else {
          if (car.getGear() > 0) car.setRpm(car.getRpm()+50);
          moveCar = (float)  (Math.pow(moveCar + car.move(),car.getAcceleration()));
        }
        carTime = millis() - startTime;

        if (comp.getGear() == 0 && millis() >= startTime+100) comp.incGear();
        else if (comp.getRpm() > 9700) comp.incGear();
        else {
          if (comp.getGear() > 0) comp.setRpm(comp.getRpm()+50);
          moveComp = (float) (Math.pow(moveComp + comp.move(),comp.getAcceleration()));
        }
        compTime = millis() - startTime;
      } else showEnd = true;
    }

    float fraction = moveCar / 2500;
    boolean white = false;
    if ((int) (fraction * width) / (width / 60) % 2 == 0) white = true;

    rectMode(CORNER);
    if (white) fill(255);
    else fill(#FF0000);
    float firstSize = (fraction * width) % (width / 60);
    float x = width - firstSize;
    
    if (2500 - moveCar < width) {
      fill(255);
      rect(2500 - moveCar, 150, width/60, 400);
      rect(2500 - moveCar - firstSize, 150, firstSize, 20);
      rect(2500 - moveCar - firstSize, 530, firstSize, 20);
      x = 2500 - moveCar - firstSize;
    } else {
      rect(width - firstSize, 150, firstSize, 20);
      rect(width - firstSize, 530, firstSize, 20);
    }
    
    while (x > 0) {
      x -= width/60;
      white = !white;
      if (white) fill(255);
      else fill(#FF0000);
      rect(x, 150, width/60, 20);
      rect(x, 530, width/60, 20);
    }

    translate(width/2,height/2);
    rotate(radians(90));
    
    if (weather.getWeatherType() == WeatherType.RAINY) {
       weather.getPuddle(-100,200);
       rotate(radians(90));
       weather.getPuddle(-100,-100);
       rotate(radians(-90));
    }

    //display cars
    if (moveCar > moveComp) {
      car.display(115,550 - (moveCar - moveComp),37,100,false);
      comp.display(-115,550,37,100,false);
    } else {
      car.display(115,550,37,100,false);
      comp.display(-115,550 - (moveComp - moveCar),37,100,false);
    }

    rotate(radians(-90));
    translate(-width/2,-height/2);
    
    if (showEnd) {
      rectMode(CENTER);
        fill(#1E1E1E);

        PImage toShow = loss;
        String time = "Opponent Time: " + compTime/1000.0 + "s";
        if (moveComp < 2500) {
          toShow = win;
          time = "Your Time: " + carTime/1000.0 + "s";
          rect(width/2, height/2, 450, 150);
          if (!addedPoints) {
            Records.points += 1000;
            int lastAchievement = 0;
            if (Records.achievements.size() > 0)
              lastAchievement = Records.achievements.get(Records.achievements.size() - 1).getValue();
            int nextAchievement = lastAchievement + 10000 * (Records.achievements.size() + 1);
            if (Records.points >= nextAchievement)
              Records.achievements.add(new Achievement(nextAchievement, AchievementType.PTS));
            addedPoints = true;
          }
        }
        
        Label displayTime = new Label(width/2, height/2 + 100, time);
        displayTime.setSize(30);
        displayTime.setFont(Font.RALEWAYBOLD);
        displayTime.display();

        imageMode(CENTER);
        image(toShow, width/2, height/2); 
    }

    //display the buttons
    for (Button b: buttons) {
      b.display();
    }

    // display the lights for the dountdown
    if (light >= 0 && light < 5) {
      fill(#FBFF00);
      ellipse(157.78-light*29.14,311.3,22.6,22.6);
      ellipse(157.78-light*29.14,387.01,22.6,22.6);
      delay(1000);
      light++;
    } else if (light == 5 && car.getGear() < 1) {
      fill(#04FF00);
      ellipse(157.78-4*29.14,311.3,22.6,22.6);
      ellipse(157.78-4*29.14,387.01,22.6,22.6);
    }

    DecimalFormat f = new DecimalFormat("0.0");
    Label weatherLabel = new Label(
      900,
      height - 70,
      "Forecast: " + weather.getWeatherType() + "\nTemperature: " +
      f.format(weather.getTemp()) + " F\nWind speed: " + f.format(weather.getWindSpd()) +
      " m/s\nWind direction: " + f.format(weather.getWindDir()) + " degrees"
    );
    weatherLabel.setSize(18);
    weatherLabel.setAlignment(LEFT, CENTER);
    weatherLabel.display();

    // display rpm and gear
    Label rpm = new Label(200, 620, "RPM: " + car.getRpm() + "\nGear:" + car.getGear());
    rpm.setSize(30);
    rpm.setFont(Font.RALEWAYBOLD);
    rpm.display();
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
      resetRaceSettings();
      resetWeather = false;
    } else if (index == 2) {
      light = -1;
      resetRaceSettings();
      resetWeather = true;
    }
  }

  private void resetRaceSettings() {
    addedPoints = false;
    if (resetWeather) {
      weather = new Weather();
    }
    moveCar = 0;
    moveComp = 0;
    carTime = 0;
    compTime = 0;
    startTime = 0;
    car.setGear(0);
    comp.setGear(0);
    car.setRpm(0);
    comp.setRpm(0);
  }

  public void keyClicked(int code) {
    if (light == 5) {
      if (code == UP) car.incGear();
      else if (code == DOWN) car.decGear();
    }
  }

  public Weather getWeather() {
    return weather;
  }
}
