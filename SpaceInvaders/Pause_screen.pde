void pauseScreen() {
  
    image(pause, 0, 0);
    
    

    if (mouseX >= 235 && mouseX <= 413 && mouseY >= 330 && mouseY < 386 ) {
      playHover = true;
      image(continue2, 235, 330, 178, 56);
    } else {
      image(continue1, 235, 330, 178, 56);
    }
  
}