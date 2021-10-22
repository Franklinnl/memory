void toonSpelScherm() {

  plaatsKaartenGeschud();
  tekenText(gameScoreKnopX, gameScoreKnopY, WIT, 32,  "Score speler: " + score );
  
}

float berekenGrid() {
  return floor(sqrt(aantalKaarten + 1));
}
