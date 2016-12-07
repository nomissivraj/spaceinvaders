

void laser() {

    if(isLaserFiring) {      
      fill(0, 200, 0);
      image(laser,laserXPos,laserYPos,4,30);
      laserYPos = laserYPos -20; //set laser to move upwards at a speed of 30pixels per tick.
    }
    
    if(laserYPos <= -20)// When laser goes off screen
    {
       isLaserFiring = false; // sets to false when laser goes off screen
    }
}


void laserPos() {
  
  laserXPos = shipX-2;
  laserYPos = shipY-62;
  
  isLaserFiring = true;
  
}