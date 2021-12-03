class NPC extends GameObject{
   Hero hero;
   HealthBar hpBar;
   PImage attack;
   ArrayList <Shot> attacks;
   float mass = 25;

  NPC (HealthBar hp,Hero h, PVector l,PVector v){
  super(l,v);
  hero = h;
  hpBar = hp;
  loadVisuals("../monster_left.png","../monster_right.png", 100);

  
  attacks = new ArrayList<Shot>();
  attack = loadImage("../speed.png");
  }
  
   void display(){
   if (direction){
      image(visualLeft, location.x - visualLeft.width/2, location.y - visualLeft.height/2);
   }else{
     image(visualRight, location.x - visualRight.width/2, location.y - visualRight.height/2);
   }
   doDmg();
   update();
   hpBar.display();
   isShot();

  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    checkEdges();
    if (day == false){
      topSpeed *=2;
      velocity.add(acceleration);
    }else {

    }
  }
  
 void doDmg(){
  float d = hero.location.dist(location);
  if (d<50){
    hero.hpBar.dmg = true;
  }
}
  void isShot (){
    for (int i = hero.shots.size()-1; i >0; i --){
    Shot f = hero.shots.get(i);
     
     float d = f.location.dist(location);
     if (d <25){
      hpBar.dmg = true;
      hero.shots.remove(i);
     }
    }
  }
  
}
