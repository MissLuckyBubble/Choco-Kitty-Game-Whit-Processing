class CandyBag{
   PVector location;
   PImage candyBag;
   Hero hero;
   
   CandyBag(Hero h){
   candyBag  = loadImage("../candyBag.png");
   candyBag.resize(100,100);
   hero = h;   
   location = new PVector( random(100,width-100),height- 150);
   }
   
   void display(){
    
    image (candyBag, location.x, location.y);
     float d =location.dist(hero.location);
     if( d <70){
      getWeapon= true;
      CB=false;
     }
  }
   
   
}
class Shot{
   PVector location, velocity, acceleration;
  float mass;
  PImage shotImage;
  float speed = 5; 

  Shot(PImage _shotImage, PVector l, PVector d) {
    shotImage = _shotImage;
    location = l;
    PVector dir = PVector.sub(d, l);
    velocity = dir.normalize();// new PVector(random(5), 0);
    velocity.mult(speed);
    acceleration = new PVector(0, 0);
    mass = random(1, 20);
  }

  void display() {
    shotImage.resize(30,30);
    image(shotImage, location.x, location.y);
    update();
  }

  void update() {
    location.add(velocity);
  }
}
