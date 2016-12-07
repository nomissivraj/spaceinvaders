boolean[] shipKeys;

void spaceShip() { //Custom void contianing ship properties. 
  ship = loadImage("ship.png"); //loads image
  image(ship, shipX, shipY, 41, 80); // drawing image with X and Y location and sixe of 41x80 pixels

  if (shipX <= 0) { // Reached left or right edge
  
  shipX += shipSpeed * 3;
  
    println("too far left");
    
  }
else if (shipX >= 640) {
  println("too far right");
  shipX -= shipSpeed * 3;
}
}
