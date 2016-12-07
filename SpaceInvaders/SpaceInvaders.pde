//audio
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioSample fire;
AudioSample explosion;
AudioSample winSound;
AudioSample loseSound;
AudioSample movement;

// MUTE BOOLEAN
boolean mute = true; //mute on by default
boolean levelOneStart = false; // game doesn't start

boolean playHover = false;
boolean pauseHover = false;
boolean drawPause = false;

//score
int score = 0;
int scoreCount;

//cursor image
PImage cursorImg;

//other
PImage stars;
float shipSpeed = 10.0;
PImage [][] invasion = new PImage [8][5]; //declaring an array 8 columns 5 rows
PImage alien;
PImage alienA;
PImage startScreen;
PImage pause;
PImage playButton1;
PImage playButton2;
PImage continue1;
PImage continue2;
PImage reset1;
PImage reset2;
PImage level2img;
PImage level2imgA;

//win
PImage win;

//lose
PImage lose;

//laser
PImage laser;
int laserPosition = 0;
float laserXPos = 318; //sets x position (same as ship)
float laserYPos = 750; //sets y position (same as ship)
boolean isLaserFiring = false; // setting laser to false - now only exists when keypressed.

//ship
PImage ship; 
float shipX = 320; //setting X position of ship
float shipY = 750; // Setting Y position of ship



// Moving left and right
float currentXOffset = 0;
float xOffsetStep = 30;//Speed at which the invasion strafes
float minXOffset = -75;
float maxXOffset = 80;

// Moving down
float currentYOffset = 0;
float yOffsetStep = 40; // How far invaions goes down each time


void setup () {
  size(640, 800);
  //shipKeys
  shipKeys=new boolean[3];
  shipKeys[0]=false;
  shipKeys[1]=false;
  shipKeys[2]=false;
  //images
  frameRate(24);

  //load Images
  laser = loadImage("laser.png");
  stars = loadImage("background.jpg");
  win = loadImage("win.jpg");
  lose = loadImage("lose.jpg");
  cursorImg = loadImage("cursor.png");
  alienA = loadImage("alienA.png");
  startScreen = loadImage("startscreen.png");
  pause = loadImage("pause.jpg");
  playButton1 = loadImage("playButton1.png");
  playButton2 = loadImage("playButton2.png");
  continue1 = loadImage("continue1.png");
  continue2 = loadImage("continue2.png");
  reset1 = loadImage("reset1.png");
  reset2 = loadImage("reset2.png");
  level2img = loadImage("level2.png");
  level2imgA = loadImage("level2a.png");


  // INVASION ARRAY
  for (int column=0; column < invasion.length; column++) { // giving column value of 0. When column less than length of entire army so [8] [5] then add to column
    for (int i=0; i<invasion[column].length; i++) { // sets count to 0 while count is less than army and coulmn length add to count each time.
      invasion[column][i] = loadImage("alien.png"); // Putting image into column and row (i) and then putting the array now containing the image into alien PImage  variable
    }
  }
  //AUDIO
  minim = new Minim(this);
  player = minim.loadFile("track.mp3");
  if (mute == false) {
    player.play();
    player.setGain(-12.0);
  } 
  //END INVASION ARRAY


  //AUDIO
  fire = minim.loadSample("fire.wav", 512); //load audio sample
  explosion = minim.loadSample("explosion.wav", 512); //load audio sample
}

void draw () {
  //change mouse
  if (mouseX > 0 && mouseX <= 640 && mouseY > 0 && mouseY <= 800) { // if mouse cursor is within the dimensions of the window (640x800)
    smooth();
    cursor(cursorImg, 0, 0); // Hide mouse cursor
  }


  introScreen();

  if (levelOneStart == true) {// levelOneStart
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
    text("LEVEL 1", 260, 35);
        
    //score text
    fill(255);
    text("SCORE: " + score, 10, 20, -80);
    
  }//this closes levelOneStart
  //WIN SCENARIO
  if (score >= 2000) {
      level1win = true;
  }
  if (level1win == true){
    winScreen();
  }
  
    level2winScreen();
    //LOSE SCENARIO
    gameOver();
    level2();
    gameOver2();
    
    
  

  //--------- pause screen
  if (drawPause == true) {
    pauseScreen();
  }

  //MUTE FUNCTION
  if (mute) {
    player.setGain(-100);
    fire.setGain(-100);
    explosion.setGain(-100);
  } else {
    player.play();
    player.setGain(-12);
    fire.setGain(-12.0);
    explosion.setGain(-12);
  }


  fill(255);
  textSize(11);
  text("Toggle music click or press M key", 448, 30);
  fill(0, 255, 0);
  textSize(14);
  text("MUSIC", 565, 18);
  fill(0, 150, 0);
  stroke(0, 255, 0);
  rect(615, 6, 12, 12);//toggle box
  
  
  if (mute) {
    fill(255, 0, 0);
    text("MUSIC", 565, 18);
    fill(150, 0, 0);
    stroke(255, 0, 0);
    rect(615, 6, 12, 12);//toggle box
  }
  //END MUTE FUNCTION
  println("level one is", levelOneStart, "|", "level 2 is", level2, "|", "GameEnd is", gameEnd  );
}

void keyPressed() {
  tabKeyPressed();
}

void keyReleased() {
  tabKeyReleased();
}

void stop()
{
  fire.close();
  explosion.close();
  winSound.close();
  loseSound.close();
  movement.close();
  minim.stop();
}

void mouseClicked() {
  tabClicked();
}
