interface WeatherDelegate {
   public Weather getWeather();
}


////////////////////////////////////////


class Weather {
  WeatherType weather;
  float windDirection; //Degrees
  double windSpeed; // m/s (from 0 ~ 15)
  double temperature; // Fahrenheit

  public Weather() {
     setRandomWeather();
     setRandomWindDir();
     setRandomWindSpd();
     setRandomTemp();
  }

  //Set randoms
  public void setRandomWeather() {
     double random = Math.random();
     if (random < 0.5) weather = WeatherType.SUNNY;
     else weather = WeatherType.RAINY;
  }

  public void setRandomWindDir() {
    float random = (float) Math.random() * 360;
    windDirection = random;
  }

  public void setRandomWindSpd() {
    double random = Math.random() * 15 + 1;
    windSpeed = random;
  }

  public void setRandomTemp() {
     double random = Math.random() * 100;
     temperature = random;
  }

  //Gets
  public WeatherType getWeatherType() {
    return weather;
  }

  public float getWindDir() {
    return windDirection;
  }

  public double getWindSpd() {
    return windSpeed;
  }

  public double getTemp() {
    return temperature;
  }
  
  public void getPuddle(int x, int y) {
    color blue = color(#003C84);
    PShape puddle, p1, p2, p3, p4;
    puddle = createShape(GROUP);
    noStroke();
    fill(blue);
    p1 = createShape(ELLIPSE,x,y,60,70);
    p2 = createShape(ELLIPSE,x+30,y+20,60,70);
    p3 = createShape(ELLIPSE,x-40,y-25,15,20);
    p4 = createShape(ELLIPSE,x,y+60,20,15);
    puddle.addChild(p1); puddle.addChild(p2); puddle.addChild(p3); puddle.addChild(p4);
    shape(puddle);
  }
  
}


////////////////////////////////////////


enum WeatherType {
  SUNNY, RAINY
}
