//Backgroun, Points and Visual Updates
int Points=0;
PImage background;
PImage imgUp;
//Background
void setupBackgroundImage(){

  background=loadImage ("../background2.png");
  background.resize(width,height);
}
void gameUpdates(){
  //Update When you got bonus speed
 if (Points ==90){
  imgUp = loadImage ("../speed.png");
  imgUp.resize(100,100);
  image(imgUp, width/2,200);
 }
 //Update for day and night
   if (day==true){
    background=loadImage ("../background2.png");
  }
  else {
    background=loadImage("../night.png");
  }
  background.resize(width,height);
}

//For Points , if you get 100 points you get x2 maxspeed for the rest of the game;
class Marsh {
  PImage marshmallo;
  PVector location, velocity,acceleration;

  
  Marsh( PImage _marshmallo){
    marshmallo = _marshmallo;
    location = new PVector( -20, random(height));
    velocity = new PVector(random(5),0);
    acceleration = new PVector (0,0);
    marshmallo.resize(30,30);
  }
  void display(){
    
    image (marshmallo, location.x, location.y);
    update();
  }
  
  void update(){
    location.add(velocity);
    velocity.add(acceleration);
    location.add(new PVector (0, random(-1,1)));
  }
}
  
  class MarshSystem {
   PImage imgM;
     PImage speed;
   ArrayList<Marsh> marshs;
   Hero hero;
   
   //Konstruktor
   MarshSystem(Hero h){
   imgM  = loadImage("../marsh.png");
   hero = h;
   marshs= new ArrayList<Marsh>();
   }
   
   void addMarshmallo(){
  
     marshs.add(new Marsh(imgM));
  }
  void addMarshmallo(int n){
    for(int i=0;i <n;i ++){
     marshs.add(new Marsh(imgM));
    } 
  }
  
   void run (){
    for(int i = marshs.size()-1; i>=0; i --){
      Marsh M = marshs.get(i);
      M.display();
       
       float d = M.location.dist(hero.location);
       if (d <25){
         marshs.remove(i);
         Points +=10;
       }
        
     }
    
  }
  }
 




  
 
  
  
