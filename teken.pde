void tekenKnoppenStartScherm(color kleur, float xPos, float yPos, String tekst) {
  fill(kleur);
  rect(width * xPos - breedteKnop /2, height * yPos - hoogteKnop /2, breedteKnop, hoogteKnop, radiusKnop);
  fill(WIT);
  textSize(tekstGrootteKnop);
  text(tekst, width * xPos, height * yPos);
}

void tekenText(float xPos, float yPos, color kleur, int tekstGrootte, String tekst) {

  fill(kleur);
  textSize(tekstGrootte);
  text(tekst, width * xPos, height * yPos);
}
