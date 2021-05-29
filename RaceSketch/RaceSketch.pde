private ArrayList<Button> buttons = new ArrayList<Button>();
private ArrayList<View> views = new ArrayList<View>();

void setup() {
  size(1200, 700);
  PImage bg = loadImage("homeBG.png");
  background(bg);
  
  String[] buttonTitles = {"Race", "Upgrades", "Liveries"};
  color[] buttonColors = {#3CC1B9, #3CA1C1, #3C7AC1};
  for (int i = 0; i < buttonTitles.length; i++) {
    Button button = new Button(width/2, 310 + 110 * i, 200, 70, 255);
    button.setLabel(buttonTitles[i], 0, 20);
    buttons.add(button);
  }
}

void draw() {
  for (Button b: buttons) {
    b.display();
  }
  
  Label label = new Label(width/2, 140, "NEON RACE");
  label.setSize(80);
  label.setFont(Font.BUNGEEHAIRLINE);
  label.display();
}

void mousePressed() {
   if (mouseButton == LEFT) {
     for (int i = 0; i < buttons.size(); i++) {
       if (buttons.get(i).click(mouseX, mouseY)) {
         if (i < views.size()) views.get(i).display();
       }
     }
   }
}
