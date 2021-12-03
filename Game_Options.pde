boolean timeReset = true;      //Proverka dali vremeto se e resetnalo ot posledniq obekt 
boolean timeResetForHp =true;//Proverka dali vremeto se e resetnalo ot posledniq heal
boolean CB = false;          //Proverka za candy bag
boolean getWeapon = false;  //Proverka dali imame weapon
boolean day = true;        //Proverka dali e den


void startGame(){
  
  //Puskane na marshmall (broi:vremeto koeto e minalo ot igrata/7) na vseki deset sekudni ako vremeto se e resetnalo
 if ((int)gameTime %10==0 && timeReset){
    mSystem.addMarshmallo((int)gameTime/7);
    timeReset=false;
 }
 
 //Puskane na choco barche na vseki 24 sekundi kato na 96s ima bonus healing period s mnogo choco barcheta 
 if ((int)gameTime %24 == 0 && timeReset){
   cSystem.addChocoBar();
   timeReset = false;
 }
 
 //Time reet na vseki 6 sekundi (na vsqko chislo koeto se deli na 5 s ostatuk 1)
   if ((int)gameTime % 5 ==1){
    timeReset = true;
  }
 
 //Puskane na candy Bag za Weapon na 11ta sekunda
  if ((int)gameTime ==11 && timeReset){
    CB = true;
 }
 
 //Smenqne na den na vseki 9sekundi i smenqne na nosht na vseki 14 sekundi
  if((int)gameTime %9 ==0 && timeReset && day){
    day = false;
  }else if((int)gameTime %14 == 0 && timeReset && day==false){
    day = true;
  }
}
