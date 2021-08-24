import processing.dxf.*;
boolean record = false;

import peasy.PeasyCam;
PeasyCam cam;

import controlP5.*;
ControlP5 cp5;

float x, y; 
float altura = 5;
float[] radios; 
int cantPisos = 300; 

void setup() {
  size(1280, 900, P3D);
  InicializarGUI();
  cam = new PeasyCam(this, height*2);
  cam.setViewport(300, 0, width-300, height);
  Settings();
  line[0]="solid AssimpScene";
  line[1]=" facet normal 0 0 0";
  line[2]="  outer loop";
  line[3]="  vertex ";
  line[4]="  endloop ";
  line[5]=" endfacet ";
  line[6]="endsolidAssimpScene";
}


void draw() {
  Settings();
  background(0);

  // println(Rmax);
  scale(height/Rmax);
  // lights();
  pointLight(50, 255, 255, width*5, 0, width*5);
  pointLight(140, 255, 255, -width*5, width*5, 0);
  pointLight(220, 255, 255, 0, -width*5, -width*5);

  if (record) {
    beginRaw(DXF, "copa#####.dxf");
  }
  translate(0, height, -height*1.5);
  rotateX(PI/2);

  randomSeed(1);
  // imprimiendo base
  imprimirBase();

  // imprimiendo costados
  imprimirCostados();

  // imprimiendo tapa
  // imprimirTapa();

  // Do all your drawing here
  if (record) {
    // endRaw();
    logToFile();
    record = false;
  }

  gui();
}
