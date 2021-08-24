float Rmax = 0; 
void Settings() {

  colorMode(HSB);

  radios = new float[cantPisos];


  Tmax1 = s.getArrayValue()[0]; 
  Tmax2 = s.getArrayValue()[1]; 

  Rmax = 0;
  for ( int i = 0; i<cantPisos; i= i+1) {
    //radios[i] = random(500, 800);
    //sin
    //cos
    //atan
    //asin +-
    float trig = 0;
    switch (tipo) { // S = SENO,  C = COSENO, T= ATAN, A= ASEN
    case 'S':
      trig= sin(i*Convers) ;
      break;
    case 'C':
      trig= cos(i*Convers) ;
      break;

    case 'T':
      trig=atan(i*Convers) ;
      break;

    case 'A':
      trig = tan (cos ( (i*Convers))) ;
      break;
      
    case 'F':
      trig = max(cos ( (i*Convers)), sin ( (i*Convers)));
      break;
      
    case 'G':
      trig = max(cos (2*(i*Convers)), sin ( (i*Convers)));
      break;


    default:  
      trig= sin(i*Convers) ;
      break;
    }

    if (abs == true) trig= abs(trig);
    if (neg == true) trig=   -(trig);

    radios[i]= ((trig+Tmax1)*Tmax2)+i ;  


    if (radios[i] >Rmax) Rmax = radios[i];
  }
  noStroke();
}
