public View current = new Home(new Car());
public boolean newView = true;

void setup() {
  size(1200, 700);
  background(0);
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
