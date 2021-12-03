class HealthBar{
 float health;
 float MAX_hp;
 int rectWidth = 200;
 int x,y;
 boolean dmg = false, heal = false;
 
 HealthBar(int maxHp , int _x, int _y){
  x = _x;
  y =_y;
  MAX_hp = maxHp;
  health =maxHp;
 }
 
 void display(){
   //ako e pod 25%health pokazvai v cherveno
  if (health < MAX_hp*25/100)
  {
    fill(255, 0, 0);
  }  
  //ako e pod 50% health pokazvai v julto
  else if (health < MAX_hp*50/100)
  {
    fill(255, 200, 0);
  }
  //inache pokazvai v zeleno
  else
  {
    fill(0, 255, 0);
  }
  
 // Draw bar
  noStroke();
  float drawWidth = (health / MAX_hp)* rectWidth;
  rect(x, y, drawWidth,50);
     
  
  // Outline
  stroke(0);
  noFill();
  rect(x,y, rectWidth, 50); 
  update();
 }
     void update(){
           if (health >0 && dmg==true && timeResetForHp == true){
            dmg=false;
            health = health - 0.5;
           }
           if (health < 100 && heal == true){
             heal = false;
             health += 0.5;
           }
    }
    
}
