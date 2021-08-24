void imprimirCostados() {
  for ( int i = 0; i<cantPisos-1; i= i+1) {
    beginShape2();
    for ( int j = 0; j<= Caras; j++ ) {



      float ang =  j*(TWO_PI/Caras)+ (i/rot );

      float y= sin(ang)*radios[i];
      float x= cos(ang)*radios[i];
      vertexN(x, y, altura*i);

      float ang2 =  j*(TWO_PI/Caras)+ ((i+1)/rot );

      float y2= sin(ang2)*radios[i+1];
      float x2= cos(ang2)*radios[i+1];

      vertexN(x2, y2, altura*(i+1));
    }
    endShape2();
  }
}




void imprimirBase() {
  beginShape2();
  for ( int j = 0; j<= Caras; j++ ) {
    float ang =  j*(TWO_PI/Caras);
    float y= sin(ang)*radios[0];
    float x= cos(ang)*radios[0];
    vertexN(0, 0, 0);
    vertexN(x, y, 0);
  }
  endShape2();
}


void imprimirTapa() {
  //imprimiendo tapa
  beginShape2();
  for ( int j = 0; j<= Caras; j++ ) {
    float ang =  j*(TWO_PI/Caras);
    float y= sin(ang)*radios[cantPisos-1];
    float x= cos(ang)*radios[cantPisos-1];

    vertexN(0, 0, altura);
    vertexN(x, y, altura);
  }
  endShape2();
}


void vertexN(float x, float y, float z) {
  float n = (noise(x*0.01, y*0.01, z*0.001));
  n = n* (height/Rmax)*500;
  if (noise)vertex2(x+n, y+n, z);
  else vertex2(x, y, z);
}
