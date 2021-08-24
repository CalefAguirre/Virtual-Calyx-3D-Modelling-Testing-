///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
PVector A = new PVector(0, 0, 0);
PVector B = new PVector(0, 0, 0); 
PVector C = new PVector(0, 0, 0);
boolean iniciado = false;
StringList log = new StringList();
String[] line = new String[7];
int PuntoActual=0;

void vertex2(float x, float y, float z) {
  vertex(x, y, z);
  if (record) {
    PuntoActual = PuntoActual+1;

    A.set(B);
    B.set(C);
    C = new PVector(x, y, z);
    if (PuntoActual>=3) {
      GenerarLoop(A, B, C);
    }
  }
}
void beginShape2() {
  beginShape(TRIANGLE_STRIP);
  if (record) {
    if (iniciado) {
    } else {//empieza a generar el archivo
      iniciado = true;
      log.append(line[0]);
    }
    A = new PVector(0, 0, 0);
    B = new PVector(0, 0, 0); 
    C = new PVector(0, 0, 0);
    PuntoActual=0;
  }
}



void endShape2() {
  endShape(CLOSE);
}

void GenerarLoop(PVector v1, PVector v2, PVector v3) {
  log.append(line[1]);
  log.append(line[2]);
  log.append(line[3]+v1.x+" " +v1.y+" "+v1.z);
  log.append(line[3]+v2.x+" " +v2.y+" "+v2.z);
  log.append(line[3]+v3.x+" " +v3.y+" "+v3.z);
  log.append(line[4]);
  log.append(line[5]);
}

void logToFile() {
  log.append(line[6]);
  String[] string_vector;
  string_vector = new String[log.size()];
  for (int i=0; i<log.size(); i++) {
    string_vector[i]=log.get(i);
  }
  saveStrings("ModeloSSTL.stl", string_vector);
}
