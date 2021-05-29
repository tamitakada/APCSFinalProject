private ArrayList<Button> buttons = new ArrayList<Button>();

void setup() {
  size(1200, 700);
  background(0);
  
  String[] buttonTitles = {"Race", "Upgrades", "Liveries"};
  for (int i = 0; i < buttonTitles.length; i++) {
    Button button = new Button(width/2, 280 + 120 * i, 200, 70, #45CAC1);
    button.setLabel(buttonTitles[i], 255, 20);
    buttons.add(button);
  }
}

void draw() {
  for (Button b: buttons) {
    b.display();
  }
  
  Label label = new Label(width/2, 120, "NEON RACE");
  label.setSize(80);
  label.setFont(Font.BUNGEEHAIRLINE);
  label.display();
}

void mousePressed() {
   if (mouseButton == LEFT) {
     for (Button b: buttons) {
       if (b.click(mouseX, mouseY)) print("clicked!");
     }
   }
}
