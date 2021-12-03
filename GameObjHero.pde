class Hero extends GameObject {
  HealthBar hpBar;       //Health Bar
  PVector aimDirection; //Aim Direction
  ArrayList <Shot> shots;
  PImage shotImage,aimImage;
  
  //Konstruktur
  Hero(HealthBar hp,PVector l, PVector v){
    super(l,v);
    loadVisuals("../hero_left.png","../hero_right.png",80);
    hpBar = hp;
    
    shots = new ArrayList<Shot>();
    shotImage = loadImage("../candy.png");
    aimImage =loadImage("../aim.png");
  }
  
  //Display the champion
  void display(){
   if (direction){
      image(visualLeft, location.x - visualLeft.width/2, location.y - visualLeft.height/2);
   }else{
     image(visualRight, location.x - visualRight.width/2, location.y - visualRight.height/2);
   }
   hpBar.display();
   update();
    calculateWeaponDirection();
    displayShots();
  
  }
  //Update, add acceleration and limits
  void update(){
   
   if(keyPressed){
     moveWithKey();
   }else{
    velocity.add(acceleration); 
   }
   velocity.add(acceleration);
   velocity.limit(topSpeed);
   location.add(velocity);
   
   //Update when you get 100 Points
   if(Points %100 == 0){
    topSpeed *=2;
   }
   
   checkEdges();
   
   //Update when you got Weapon
   if(getWeapon){
    if (key == ' '){
      addShot(new PVector(location.x, location.y), aimDirection);
    }
   }
  } 
  
  
  //Move with keyboard
  float stepSize = 5;
  void moveWithKey() {
    PVector dirKey = location;

    if (key == 'a' || key == 'A') {
      dirKey.x -= stepSize;
      if (!direction) direction = true;
    }
    if (key == 'd' || key == 'D') {
      dirKey.x += stepSize;
      if (direction) direction = false;
    }
    if (key == 'w' || key == 'W') {
      dirKey.y -= stepSize;
    }
    if (key == 's' || key == 'S') {
      dirKey.y += stepSize;
    }
  }
  
  
 void calculateWeaponDirection() {
   if (getWeapon==true){
  PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(150);

    aimDirection = PVector.add(location, dir);
    // velocity = dir;
  
    aimImage.resize(30,30);
    image (aimImage,aimDirection.x, aimDirection.y);
   }  
  }
   
    
    void addShot(PVector l, PVector d) {
      shots.add(new Shot(shotImage, l, d));
    }

      void displayShots() {
        if(getWeapon==true){
          for (int i = shots.size()-1; i >= 0; i--) {
           
        
            Shot f = shots.get(i);
            
            f.display();
            
      
            if ((f.location.x > width || f.location.x < 0) || (f.location.y > height || f.location.y < 0)) {
              shots.remove(i);
            }
            
          }
        }
     }

}

    
    
    
