void gameOver2 () {
  
  
  if (level2 == true && currentAlienImage != null && alienYPos + 60 >= shipY) { //if aliens reach certain pixel height (at bottom of screen) show lose screen.
    image(lose, 200, 200);
    
    gameEnd = true;
    levelOneStart = false;
    level2 = false;
    
    
    // ------------- rollover button graphics
    if (playHover == false) {
      image(reset1, 275, 100, 89, 28);
    }
  if (mouseX >= 275 && mouseX <= 364 && mouseY >= 100 && mouseY < 128 ) {
    playHover = true;
    image(reset2, 275, 100, 89, 28);
  } else {
    image(reset1, 275, 100, 89, 28);
  }
}
}