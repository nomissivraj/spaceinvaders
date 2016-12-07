PImage currentAlienImage;
float alienXPos;
float alienYPos;

int time;
int delayTime = 1100; //1100 default
int menuDelay = 10000;

int alienFrames = 0;
int alienAnimSpeed = 900;


void alienDraw() {




  for (int column = 0; column < invasion.length; column++) { // giving column value of 0. When column less than length of entire army so [8] [5] then add to column
    for (int row = 0; row < invasion[column].length; row++) { // sets count to 0 while count is less than army and coulmn length add to count each time.


      currentAlienImage = invasion[column][row];

      alienXPos = 90 + (column * 60) + currentXOffset; // puts current offset and column position/width into alienXpos variable
      alienYPos =  50 + (row * 60) + currentYOffset; // puts current offset and column position/width into alienYpos variable



      if (isLaserFiring && currentAlienImage != null) {       

        // ------------------ hit detection -----------------

        if (alienXPos <= laserXPos + 4 && alienXPos + 25 >= laserXPos && alienYPos <= laserYPos +30 && alienYPos + 30 >= laserYPos) {
          currentAlienImage = invasion[column][row] = null;
          isLaserFiring = false;
          scoreCount++;
          score = scoreCount * 50;
          //AUDIO
          explosion.trigger();
          explosion.setGain(-12);
        }
      }



      if (currentAlienImage != null) {
        if (alienFrames++<alienAnimSpeed) {
          image(currentAlienImage, alienXPos, alienYPos, 25, 40);
        } else {
          image(alienA, alienXPos, alienYPos, 25, 40);
        }

        if (alienFrames>=2*alienAnimSpeed)alienFrames=0;

        //image(currentAlienImage, alienXPos, alienYPos, 25, 40);
      }
      if (currentAlienImage != null && alienYPos + 60 >= shipY) {
        //if aliens reach certain pixel height (at bottom of screen) show lose screen.
        image(lose, 0, 0);
        mute = true;
      }
    }
  }



  // ------------------ movement ------------------

  if (millis() - time >= delayTime) { //Setting up a delay for side to side movement. 
    currentXOffset += xOffsetStep;

    if (currentXOffset >= maxXOffset || currentXOffset <= minXOffset) { // Reached left or right edge
      xOffsetStep = -xOffsetStep; // Change direction     
      currentYOffset += yOffsetStep; // Drop down
    }

    time = millis(); // resetting the time to 0
  }
}
