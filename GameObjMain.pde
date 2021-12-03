class GameObject{
  //Physics
  PVector location;      //poziciq
  PVector velocity;      //posoka
  PVector acceleration; //uskorenie
  float topSpeed = 10;
  float mass = 25;
  
  //Visual
  PImage visualLeft;
  PImage visualRight;
  boolean direction =true;
  
  //Konstruktor
  GameObject(PVector l, PVector v){
    location = l;
    velocity = v;
    
    acceleration = new PVector(0,0);
  }
  
  void loadVisuals( String fileLocationLeft,String fileLocationRight, int resize){
    visualLeft = loadImage(fileLocationLeft);
    visualLeft.resize(resize,resize);
    visualRight = loadImage(fileLocationRight);
    visualRight.resize(resize,resize);
  }
  
 void display(){
   if (direction){
      image(visualLeft, location.x - visualLeft.width/2, location.y - visualLeft.height/2);
   }else{
     image(visualRight, location.x - visualRight.width/2, location.y - visualRight.height/2);
   }
   update();
 }
 
 void update() {

    velocity.add(acceleration);

    velocity.limit(topSpeed);
    location.add(velocity);

    checkEdges();
  }
 
 
    void applyForce(PVector f){
   PVector force = PVector.div(f,mass);
   acceleration.add(force);
  }
  
   void checkEdges() {
    if (location.x > width-30) {
      velocity.x *= -1;
      location.x = width-30;
    } else if (location.x < 30) {
      velocity.x *= -1;
      location.x = 30;
    }
   
    if (location.y > height-90){
      velocity.y *= -0.7;
      location.y = height-90;
    }else if (location.y < 30) {
      velocity.y *= -1;
      location.y = 30;
    }
  }
  
}
