float system_time;

int totalMarshCreated;

void GUI_bar() {


  float xCoord = width/2-80;

  fill(0, 0, 255);
  rect(xCoord, 0, 220, 50);


  fill(255);
  textSize(20);
  text("Choco Kitty", xCoord + 60, 16);

  text("Time: "+(int)gameTime, xCoord + 5, 40);

  fill(0, 255, 0);
  text("Points: "+Points, xCoord + 120, 40);
  
fill(0,0,0);
text("HP: " + hero.hpBar.health, 10,48);
text("HP: " + npc.hpBar.health, width-90, 48);
  
}
