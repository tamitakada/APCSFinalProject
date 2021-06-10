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
  private boolean addedPoints = false;
  private boolean resetWeather = false;

  private boolean reload = true;
  private boolean longer = false; 

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
    
    Button shortRace = new Button(500, 50, 70, 80, #1E1E1E);
    shortRace.setLabel("Short\nRace",255,20);
    
    Button longRace = new Button(700, 50, 70, 80, #1E1E1E);
    longRace.setLabel("Long\nRace",255,20);

    buttons.add(backButton);
    buttons.add(startButton);
    buttons.add(resetButton);
    buttons.add(shortRace);
    buttons.add(longRace);

    bg = loadImage("raceBG.png");
    loss = loadImage("lose_label.png");
    win = loadImage("win_label.png");
  }

  public void display() {
    
    //display for the short race
    if (longer == false) {
      background(bg);
  
      translate(width/2,height/2);
      rotate(radians(90));
  
      if (weather.getWeatherType() == WeatherType.RAINY) {
        weather.getPuddle(-100,200);
        rotate(radians(90));
        weather.getPuddle(-100,-100);
        rotate(radians(-90));
      }
  
      //display cars
      car.display(115,550-moveCar,37,100,false);
      comp.display(-115,550-moveComp,37,100,false);
  
      if (light == 5) {
        //RaceSketch.setCar(car,light);
        if (startTime == 0) {
          startTime = millis();
        }
  
        // calculate time and move cars
        if (moveCar < 1073 && moveComp < 1073) {
          if (car.getRpm() > 9999) {
            moveCar = (float)  (moveCar + car.move());
          } else {
            if (car.getGear() > 0) {
              car.setRpm(car.getRpm()+50);
            }
            moveCar = (float)  (Math.pow(moveCar + car.move(),car.getAcceleration()));
          }
          carTime = millis() - startTime;
  
          if (comp.getGear() == 0) {
            if (millis() >= startTime+100) {
              comp.incGear();
            }
          }
          if (comp.getRpm() > 9700) {
            comp.incGear();
          } else {
            if (comp.getGear() > 0) {
              comp.setRpm(comp.getRpm()+50);
            }
            moveComp = (float) (Math.pow(moveComp + comp.move(),comp.getAcceleration()));
          }
          compTime = millis() - startTime;
        } else {
          rotate(radians(-90));
          translate(-width/2,-height/2);
  
          rectMode(CENTER);
          fill(#1E1E1E);
  
          PImage toShow = win;
          if (moveCar < 1073) {
            toShow = loss;
            rect(width/2, height/2, 540, 150);
  
            //Display time of opponent
            Label displayCompTime = new Label(1000, 170, "Opponent Time: " + compTime/1000.0 + "s");
            displayCompTime.setSize(30);
            displayCompTime.setFont(Font.RALEWAYBOLD);
            displayCompTime.display();
          } else {
            rect(width/2, height/2, 450, 150);
  
            //Display time of user
            Label displayCarTime = new Label(1000, 520, "Your Time: " + carTime/1000.0 + "s");
            displayCarTime.setSize(30);
            displayCarTime.setFont(Font.RALEWAYBOLD);
            displayCarTime.display();
  
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
  
          imageMode(CENTER);
          image(toShow, width/2, height/2);
          
          translate(width/2,height/2);
          rotate(radians(90));
        }
      } else {
        car.display(115,550,37,100,reload);
        comp.display(-115,550,37,100,false);
        reload = false;
      }
    }
    
    //display for the longer race
    if (longer == true) {
      
      image(bg,1200-moveCar,350);
  
      translate(width/2,height/2);
      rotate(radians(90));
      
      if (weather.getWeatherType() == WeatherType.RAINY) {
        weather.getPuddle(0,0);
        weather.getPuddle(100,100);
      }
      
      //display cars
      car.display(115,550-moveCar,37,100,false);
      comp.display(-115,550-moveComp,37,100,false);
  
      if (light == 5) {
        //RaceSketch.setCar(car,light);
        if (startTime == 0) {
          startTime = millis();
        }
  
        // calculate time and move cars
        if (moveCar < 1200 && moveComp < 1200){
          if (car.getRpm() > 9999) {
            moveCar = (float)  (moveCar + car.move());
          } else {
            if (car.getGear() > 0) {
              car.setRpm(car.getRpm()+100);
            }
            moveCar = (float) (1.005 * (Math.pow(moveCar + car.move(),car.getAcceleration())));
          }
          carTime = millis() - startTime;
  
          if (comp.getGear() == 0) {
            if (millis() >= startTime+100) {
              comp.incGear();
            }
          }
          if (comp.getRpm() > 9700) {
            comp.incGear();
          } else {
            if (comp.getGear() > 0) {
              comp.setRpm(comp.getRpm()+100);
            }
            moveComp = (float) (1.005 * (Math.pow(moveComp + comp.move(),comp.getAcceleration())));
          }
          compTime = millis() - startTime;
        } else {
          rotate(radians(-90));
          translate(-width/2,-height/2);
  
          rectMode(CENTER);
          fill(#1E1E1E);
  
          PImage toShow = win;
          if (moveCar < 1200) {
            toShow = loss;
            rect(width/2, height/2, 540, 150);
  
            //Display time of opponent
            Label displayCompTime = new Label(1000, 170, "Opponent Time: " + compTime/1000.0 + "s");
            displayCompTime.setSize(30);
            displayCompTime.setFont(Font.RALEWAYBOLD);
            displayCompTime.display();
          } else {
            rect(width/2, height/2, 450, 150);
  
            //Display time of user
            Label displayCarTime = new Label(1000, 520, "Your Time: " + carTime/1000.0 + "s");
            displayCarTime.setSize(30);
            displayCarTime.setFont(Font.RALEWAYBOLD);
            displayCarTime.display();
  
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
  
          imageMode(CENTER);
          image(toShow, width/2, height/2);
          
          translate(width/2,height/2);
          rotate(radians(90));
        }
      } else {
        car.display(115,550,37,100,reload);
        comp.display(-115,550,37,100,false);
        reload = false;
      }
    }
    
    rotate(radians(-90));
    translate(-width/2,-height/2);
    
    // display the buttons
    for (Button b: buttons) {
      b.display();
    }

    // display the lights for the dountdown
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
      if (car.getGear() < 1) {
        fill(#04FF00);
        ellipse(157.78-4*29.14,311.3,22.6,22.6);
        ellipse(157.78-4*29.14,387.01,22.6,22.6);
      }
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
    else if (index == 3) {
      longer = false;
      light = -1;
      resetRaceSettings();
      resetWeather = true;
      bg = loadImage("raceBG.png");
    }
    else if (index == 4) {
      longer = true;
      light = -1;
      resetRaceSettings();
      resetWeather = true;
      bg = loadImage("raceBG2.png");
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
