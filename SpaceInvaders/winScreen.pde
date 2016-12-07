boolean level1win = false;


void winScreen () {

  levelOneStart = false;

  image(win, 0, 0);
  fill(255);
  text("SCORE: " + score, 10, 20, -80);


  if (playHover == false) {
    image(level2img, 275, 100, 89, 28);
  }




  if (mouseX >= 275 && mouseX <= 364 && mouseY >= 100 && mouseY < 128 ) {
    playHover = true;
    image(level2imgA, 275, 100, 89, 28);
  } else {
    image(level2img, 275, 100, 89, 28);
  }
}



void level2winScreen () {


  if (score >= 4000) {
    image(win, 0, 0);
    fill(255);
    text("SCORE: " + score, 10, 20, -80);
    level2 = false;

    if (playHover == false) {
      image(reset2, 275, 100, 89, 28);
    }



    if (mouseX >= 275 && mouseX <= 364 && mouseY >= 100 && mouseY < 128 ) {
      playHover = true;
      image(reset2, 275, 100, 89, 28);
    } else {
      image(reset1, 275, 100, 89, 28);
    }
  }
}