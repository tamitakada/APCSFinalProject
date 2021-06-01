public View current = new Home(new Car());
public boolean newView = true;
public Fonts fonts;

void setup() {
  size(1200, 700);
  background(0);
  fonts = new Fonts();
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
