public View current = new Home(new Car());
public boolean newView = true;
public Fonts fonts;
public static Car car;
public static int light;

void setup() {
  size(1200, 700);
  background(0);
  fonts = new Fonts();
  light = 0;
}

void draw() {
  if (newView) {
    current.setUp(); newView = false;
  }
  current.display();
}

void mousePressed() {
   if (mouseButton == LEFT) {
     ArrayList<Button> buttons = current.getButtons();
     for (int i = 0; i < buttons.size(); i++) {
       if (buttons.get(i).click(mouseX, mouseY)) {
         current.clicked(i);
       }
     }
   }
}

void keyPressed() {
  current.upKeyPressed();
  //if (light == 5) {
  //  if (keyCode == UP) {
  //    car.incGear();
  //  }
  //  if (keyCode == DOWN) {
  //    car.decGear();
  //  }
  //}
}
