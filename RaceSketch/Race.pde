public class Race implements View {
  private Car car;
  private ArrayList<Button> buttons;
  
  public Race(Car car) {
    this.car = car;
    buttons = new ArrayList<Button>();
  }
  
  public void setUp() {
  }
  
  public void display() {
  }
  
  public ArrayList<Button> getButtons() {
    return buttons;
  }
  
  public void clicked(int index) {
    
  }
}
