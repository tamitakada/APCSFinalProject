class Weather {
  WeatherType weather;
  double windDirection; //Degrees
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
    double random = Math.random() * 360;
    windDirection = random;
  }
  
  public void setRandomWindSpd() {
    double random = Math.random() * 15;
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
  
  public double getWindDir() {
    return windDirection;
  }
  
  public double getWindSpd() {
    return windSpeed; 
  }
  
  public double getTemp() {
    return temperature; 
  }
}
