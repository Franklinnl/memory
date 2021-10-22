void maakSetjeKaarten() {
  for (int i = 0; i < aantalSetjes; i++) {
    String kaartNaam = afbeeldingKaarten[i];  
    memoryKaarten[i] = kaartNaam;
    memoryKaarten[aantalSetjes+i] = kaartNaam;  ////CHECK DEZE WANNEER MEERDERE SETJES
    memoryKaarten[aantalSetjes * 2] = vasteSpeelKaarten[1];
  }
}

void schudSetjeKaarten() {
  maakSetjeKaarten();
  int getal;
  String vervangen;
  for (int i = 0; i < memoryKaarten.length; i++) {
    vervangen = memoryKaarten[i];
    getal = int(random( memoryKaarten.length));
    memoryKaarten[i] = memoryKaarten[getal];
    memoryKaarten[getal] = vervangen;
  }
}

void laadKaartenGeschud() {
  schudSetjeKaarten();
  for (int i = 0; i < memoryKaarten.length; i++) {
    String kaart = memoryKaarten[i];
    kaarten[i] = loadImage(kaart);
  }
}

void plaatsKaartenGeschud() {
  int kaartIndex = 0;
  while (kaartIndex < aantalKaarten) {
    for (int i = 0; i < berekenGrid(); i++) {
      for (int j = 0; j < berekenGrid(); j++) {
        XYcoordinaten[kaartIndex][0] = kaartBreedte  + ( marge + kaartBreedte) * j;
        XYcoordinaten[kaartIndex][1] = kaartHoogte +  (marge + kaartHoogte) * i;
        if (isSetje && kaartOpen[kaartIndex][0]) {
          image(openKaart, XYcoordinaten[kaartIndex][0], XYcoordinaten[kaartIndex][1], kaartBreedte, kaartHoogte);
          println(kaartIndex);
        } else {
          if (!kaartOpen[kaartIndex][0] && !isSetje) {
            image(blindeKaart, XYcoordinaten[kaartIndex][0], XYcoordinaten[kaartIndex][1], kaartBreedte, kaartHoogte);
          } else if (kaartOpen[kaartIndex][0] && !isSetje ) {
            image(kaarten[kaartIndex], XYcoordinaten[kaartIndex][0], XYcoordinaten[kaartIndex][1], kaartBreedte, kaartHoogte);
          }
        }
        kaartIndex++;
      }
    }
  }
}



void openKaart() {
  for (int i =0; i < aantalKaarten; i++) { 
    image(kaarten[i], XYcoordinaten[i][0], XYcoordinaten[i][1], kaartBreedte, kaartHoogte);
  }
}


void vergelijkOpenKaarten() {
  if (vergelijkKaarten[0] == vergelijkKaarten[1] && vergelijkKaarten[0] != null && vergelijkKaarten[1] != null ) {
    score++;
    isSetje = true;
    eindScherm++;

  } else if (vergelijkKaarten[0] != vergelijkKaarten[1]) {
    println("GEEN SCORE");
  }
}
