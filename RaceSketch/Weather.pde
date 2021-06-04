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
}


////////////////////////////////////////


enum WeatherType {
  SUNNY, RAINY
}
