void tabKeyPressed() {
  if (key == CODED) { //not a char value 

    if (keyCode == LEFT) { // if left arrow key is pressed:
      shipKeys[0]=true;
    } else if (keyCode == RIGHT) { // if right arrow key is pressed:
      shipKeys[1]=true;
    }


    if (keyCode == UP && !isLaserFiring) {
      shipKeys[2]=true;
    }
  }
}

void tabKeyReleased() {
  //MUTE SWITCH - If key 'm' is pressed switch boolean from false to true or vice versa
  switch (key) {
  case 'm':
    if (mute) mute = false;
    else if (!mute) mute = true;
  }

  switch (key) {
  case 'p':
    if (levelOneStart) {
      levelOneStart = !levelOneStart;
      drawPause = true;
    } else {
      levelOneStart = !levelOneStart;
      drawPause = !drawPause;
    }
  }


  if (key == CODED) { //not a char value 

    if (keyCode == LEFT) { // if left arrow key is pressed:
      shipKeys[0]=false;
    } else if (keyCode == RIGHT) { // if right arrow key is pressed:
      shipKeys[1]=false;
    }

    //      if (keyCode == DOWN) { // if left arrow key is pressed:
    //        reset();
    //        levelOneStart = true;
    //      } 


    if (keyCode == UP && !isLaserFiring) {
      shipKeys[2]=false;
      laserPos();
      if (mute == false) {
        fire.trigger();
        fire.setGain(-12.0);
      }
    }
  }
}



void tabClicked() {
  // ------- Button to mute game ------------
  if (mouseX >= 565 && mouseX <= 628 && mouseY >= 6 && mouseY <= 20) {
    mute = !mute;
  }

  // ------- Button to start game --------------
  if (drawPause == false && mouseX >= 235 && mouseX <= 413 && mouseY >= 300 && mouseY < 356 ) {
    levelOneStart = true;
  }

  // ------- Button to pause/continue game ------------
  if (drawPause == true && mouseX >= 235 && mouseX <= 413 && mouseY >= 330 && mouseY < 386 ) {
    drawPause = false;
    levelOneStart = true;
  }

  // ------- Button to restart game if you lose
  if (gameEnd == true && mouseX >= 275 && mouseX <= 364 && mouseY >= 100 && mouseY < 128 ) { // reset game (on lose screen) button area
    levelOneStart = true;
    gameEnd = false; // reset gameEnd to false as game is now playing again.
    reset();
  }

  // ------- Button to proceeed to level 2 ------------
  if (level1win == true && level2 == false && mouseX >= 275 && mouseX <= 364 && mouseY >= 100 && mouseY < 128 ) { // start level 2 (on win screen) button area
    level2 = true;
    levelOneStart = false;
    reset();
  }
}