 //healing
class ChocoBar{
  PImage chocoBar;
  PVector location, velocity,acceleration;
  
  
  ChocoBar(){
    chocoBar = loadImage ("../choco_heal.png");
    location = new PVector(random(width),-20);
    velocity = new PVector(0, 2);
    acceleration = new PVector (0,0);
    chocoBar.resize(50,50);
  }
   void display(){
    
    image (chocoBar  , location.x, location.y);
    update();
    
  }
  
  void update(){
    
    location.add(velocity);
    velocity.add(acceleration);
    location.add(new PVector (0, random(-1,1)));
    
  }
}
class ChocoBarSystem{
   ArrayList<ChocoBar>chocoBars;
   Hero hero;
   
  //Konstruktor
  ChocoBarSystem(Hero h){
    hero = h;
    chocoBars = new ArrayList <ChocoBar>();
  }
  
  void addChocoBar(){
   chocoBars.add(new ChocoBar());
  }
  
  void run(){
    for (int i = chocoBars.size()-1; i >=0; i--){
     ChocoBar C = chocoBars.get(i);
     C.display();
    
     float d = C.location.dist(hero.location);
     if( d <50){  
       hero.hpBar.heal = true;
       chocoBars.remove(i);
     }
     
    }
  
  }
}
