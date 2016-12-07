void reset(){
for (int column=0; column < invasion.length; column++) { // giving column value of 0. When column less than length of entire army so [8] [5] then add to column
    for (int i=0; i<invasion[column].length; i++) { // sets count to 0 while count is less than army and coulmn length add to count each time.
      invasion[column][i] = loadImage("alien.png"); // Putting image into column and row (i) and then putting the array now containing the image into alien PImage  variable
    }
  }

gameEnd = false;
score = 0;
scoreCount = 0;
laserPosition = 0;
laserXPos = 318; 
laserYPos = 750; 
isLaserFiring = false; 
shipX = 320; 
shipY = 750; 
currentXOffset = 0;
xOffsetStep = 30;
currentYOffset = 0;



}