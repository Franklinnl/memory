boolean muisOpKnop(float xPos, float yPos ) {
  return( mouseX > width * xPos - breedteKnop / 2 && mouseX < width * xPos + breedteKnop/2 &&
    mouseY > height * yPos - hoogteKnop / 2 && mouseY < height * yPos + hoogteKnop/2);
}

void muisOpKaart() {
  for (int i =0; i < aantalKaarten; i++) {
    if (mouseX > XYcoordinaten[i][0] && mouseX < kaartBreedte + XYcoordinaten[i][0]  && 
      mouseY > XYcoordinaten[i][1]  && mouseY < kaartHoogte + XYcoordinaten[i][1] ) {

      if (vergelijkKaarten[0] != null && vergelijkKaarten[1] != null) {
        for (int j =0; j < aantalKaarten; j++) {
         kaartOpen[j][0] = false;
          memoryKaarten[i] = vasteSpeelKaarten[2];
          vergelijkKaarten[0] = null;
          vergelijkKaarten[1] = null;
        }
      } else {
        kaartOpen[i][0] = true;
        if (memoryKaarten[i] == "images/doodskaart.png") {
          score--;
          vergelijkKaarten[0] = null;
          vergelijkKaarten[1] = null;
        }
        if (vergelijkKaarten[0] == null) {
          vergelijkKaarten[0]= memoryKaarten[i];
        } else if (vergelijkKaarten[1] == null && vergelijkKaarten[0] != null) {
          vergelijkKaarten[1] = memoryKaarten[i];
          vergelijkOpenKaarten();
        }
      }
    }
  }
}

void init() {
  laadKaartenGeschud();
}
