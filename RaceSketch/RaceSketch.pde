private Car car = new Car();
public View current = new Home();

void setup() {
  size(1200, 700);
  background(0);
  current.setUp();
}

void draw() {
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
