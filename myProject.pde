Hero hero;
PVector gravity = new PVector(0, 0.0000001);
PVector wind = new PVector (0.00009, 0);
HealthBar hpBar;
HealthBar enemyHpBar;
MarshSystem mSystem;
ChocoBarSystem cSystem;
float gameTime;

CandyBag candyB;

NPC npc;


boolean game = true;
boolean win = false;

void setup() {

  size (1000, 800);
  setupBackgroundImage();
  hpBar = new HealthBar(100, 0, 0);
  enemyHpBar = new HealthBar (200, width-200, 0);
  hero = new Hero(hpBar, new PVector(200, 200), new PVector(-1, 1));

  mSystem = new MarshSystem(hero);
  cSystem = new ChocoBarSystem(hero);
  candyB = new CandyBag(hero);

  npc = new NPC ( enemyHpBar, hero, new PVector(width/2, height/2), new PVector (1, 2));
}

void draw() {
  background(255);
  image(background, 0, 0);

  if (game) {
    gameUpdates();

    //bonusi
    mSystem.run();
    cSystem.run();
    if (CB == true) candyB.display();

    //Hero
    hero.display();
    hero.applyForce(gravity);
    hero.applyForce(wind);

    //Enemies
    npc.display();

    //GUI
    GUI_bar();
    gameTime +=1/frameRate;
    startGame();


    //End of the game
    if (hero.hpBar.health == 0)
    {
      game = false;
      win = false;
    }
    if (npc.hpBar.health == 0) {
      game = false;
      win =true;
    }
  }
  else {
    fill(255);
    textSize(50);
    if (win) {
      text("YOU WIN!", width/2-50, height/2-100);
      text("Completed in: " + (int)gameTime + "s", width/2-50, height/2);
      text("Points: " + Points, width/2-50, height/2+100);
    }
    if (win ==false) {
      text("GAME OVER", width/2-50, height/2-100);
      text("Time Alive: " + (int)gameTime + "s", width/2-50, height/2);
      text("Points: " + Points, width/2-50, height/2+100);
    }
  }
}
