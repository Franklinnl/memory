final color 
  WIT = #FFFFFF, 
  DONKERGRIJS = #404040;

final int 
  STARTSCHERM =0, 
  GAMESCHERM=1, 
  EINDSCHERM =2;

int spelStatus = STARTSCHERM, 
  breedteKnop, 
  hoogteKnop, 
  radiusKnop = 10, 
  tekstGrootteKnop = 20, 
  aantalSetjes = 12, 
  aantalKaarten = aantalSetjes * 2 + 1, 
  score =0, 
  marge = 20, 
  width = 1200, 
  height = 800, 
  posKaartX, 
  posKaartY,
  eindScherm =0;

float startKnopX = 0.5, 
  startKnopY = 0.5, 
  gameScoreKnopX= 0.5, 
  gameScoreKnopY = 0.07, 
  kaartBreedte = width / (berekenGrid() + 2) - (marge/2), 
  kaartHoogte = height / (berekenGrid() + 2)  - (marge/2), 
  muisOpKaartX = kaartBreedte, 
  muisOpKaartY = kaartHoogte;

String [] vasteSpeelKaarten = {"images/blindekaart.png", "images/doodskaart.png", "images/openKaart.png"};
String [] afbeeldingKaarten = 
  {"images/kaart2.png", "images/kaart3.png", 
  "images/kaart4.png", "images/kaart5.png", 
  "images/kaart6.png", "images/kaart7.png", 
  "images/kaart8.png", "images/kaart9.png", 
  "images/kaart10.png", "images/kaart11.png", 
  "images/kaart12.png", "images/kaart13.png"};
String [] memoryKaarten = new String[aantalKaarten];
PImage blindeKaart, doodsKaart, openKaart;
float [][] XYcoordinaten = new float[aantalKaarten][2]; 
PImage[] kaarten = new PImage[memoryKaarten.length];
boolean [][] kaartOpen = new boolean[aantalKaarten][1];
String [] vergelijkKaarten = new String[2];

boolean isSetje = false;


void setup() {
  size(1200, 800);
  breedteKnop = width/5;
  hoogteKnop = height/7;
  blindeKaart = loadImage(vasteSpeelKaarten[0]);
  doodsKaart = loadImage(vasteSpeelKaarten[1]);
  openKaart  = loadImage(vasteSpeelKaarten[2]);
  init();
}


void draw() {
  textAlign(CENTER, CENTER);
  switch(spelStatus) {
  case STARTSCHERM:
    background(get(1, 1));
    toonStartScherm();
    break;
  case GAMESCHERM:
    background(get(1, 1));
    toonSpelScherm();
    if (eindScherm == 13){
      spelStatus = EINDSCHERM;
      eindScherm = 0;
    }
    break;
  case EINDSCHERM:
    toonEindScherm();
    break;
  }
}

void mousePressed() {
  switch(spelStatus) {
  case STARTSCHERM:
    if (muisOpKnop(startKnopX, startKnopY)) {
      spelStatus = GAMESCHERM;
    }
    break;
  case GAMESCHERM:

    muisOpKaart();
    openKaart();
    background(get(1, 1));
    break;
  case EINDSCHERM:
    if (muisOpKnop(startKnopX, startKnopY)) {
      spelStatus = STARTSCHERM;
    }
    break;
  }
}
