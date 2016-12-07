boolean level2 = false;
void level2 () {
  
  if (level2 == true) {
    //MAIN
    image(stars, 0, 0);
    imageMode(CENTER);
    spaceShip(); //calls custom void from ship tab
    imageMode(CORNER);
    alienDraw();
    laser();
    textSize(14);


    if (shipKeys[0]) {
      shipX -= shipSpeed ;
    }
    if (shipKeys[1]) {
      shipX += shipSpeed ;
    }
    if (shipKeys[2]) {
    }
    
    fill(255);
    text("Press 'p' to pause", 260, 18);
    text("LEVEL 2", 260, 35);
    //WIN SCENARIO
    level2winScreen ();
    //LOSE SCENARIO
    gameOver();
    
    //score text
    fill(255);
    text("SCORE: " + score, 10, 20, -80);
    
    //level 2 changes
    score = scoreCount * 100;
    delayTime = 700;// 700 by default
    levelOneStart = false;
  }//this closes levelOneStart
 

}