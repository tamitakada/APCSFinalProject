public class Achievement {
  
  private int value;
  private AchievementType type;
  
  public Achievement(int value, AchievementType type) {
    this.value = value; this.type = type;
  }
  
  public int getValue() {
    return value; 
  }
  
  public AchievementType getType() {
    return type; 
  }
  
  public void setValue(int value) {
    this.value = value;
  }
}

enum AchievementType {
  PTS,
  RACES,
  LIVERIES
}
