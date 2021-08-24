boolean noise = false; 
boolean neg = false; 
boolean abs = false; 
float Convers = 0.025; 
int Caras = 30; 
float Tmax1 = 0.5; 
float Tmax2 = 200.0; 
float rot =500; 
char tipo ='S';// S = SENO,  C = COSENO, T= ATAN, A= ASEN, F, G

Slider2D s;
RadioButton r1;
void InicializarGUI() {
  cp5 = new ControlP5(this);
  
  s = cp5.addSlider2D("wave")
    .setPosition(30, 40)
    .setSize(200, 200)
    .setMinMax(1, 200.0, 10.0, 500.)
    .setValue(1, 200)
    ;
    
  cp5.addSlider("Caras")
    .setPosition(30, 260)
    .setSize(200, 20)
    .setRange(3,30)
    .setValue(30)
    .setNumberOfTickMarks(28)
    ;
    
  cp5.addSlider("rot")
    .setPosition(30, 290)
    .setSize(200, 20)
    .setRange(30,500)
    .setValue(500)
    ;
    
    
    
  cp5.addBang("BAJAR_ARCHIVO")
    .setPosition(40, height-100)
    .setSize(200, 80)
    .setTriggerEvent(Bang.RELEASE);

  cp5.addToggle("noise")
    .setPosition(40, height-150)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH);

  cp5.addToggle("ABS")
    .setPosition(100, height-150)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH);
  cp5.addToggle("NEG")
    .setPosition(160, height-150)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH);





  cp5.addSlider("Convers")
    .setPosition(40, height-200)
    .setSize(200, 20)
    .setRange(0.0, 0.1)
    .setValue(0.025)
    ;
  r1 = cp5.addRadioButton("radioButton")
    .setPosition(40, height-350)
    .setSize(40, 20)
    .setColorForeground(color(120))
    .addItem("1", 1)
    .addItem("2", 2)
    .addItem("3", 3)
    .addItem("4", 4) 
    .addItem("5", 5)
    .addItem("6", 6)  ;


  cp5.setAutoDraw(false);
}

void BAJAR_ARCHIVO() {
  record = true;
}

void gui() {

  if (tipo== 'S'||tipo=='C'||tipo== 'A'||tipo=='F'||tipo=='G') {
    cp5.getController("ABS").setVisible(true);
    cp5.getController("NEG").setVisible(true);
  }
  if (tipo== 'T') {
    cp5.getController("ABS").setVisible(false);
    cp5.getController("NEG").setVisible(true);
  }


  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.getName()=="noise") {
    if (theEvent.getValue()==1) {  
      noise = true;
    } else { 
      noise = false;
    }
  }

  if (theEvent.getName()=="ABS") {
    if (theEvent.getValue()==1) {  
      abs = true;
    } else { 
      abs = false;
    }
  }

  if (theEvent.getName()=="NEG") {
    if (theEvent.getValue()==1) {  
      neg = true;
    } else { 
      neg = false;
    }
  }


  if (theEvent.isFrom(r1)) {
    print("got an event from "+theEvent.getName()+"\t");
    for (int i=0; i<theEvent.getGroup().getArrayValue().length; i++) {
      print(int(theEvent.getGroup().getArrayValue()[i]));
    }
    println("\t "+theEvent.getValue());

    float j = theEvent.getGroup().getValue(); 
    if ( j== 1) tipo ='S';
    if ( j== 2) tipo ='C';
    if ( j==3)  tipo ='T';
    if ( j==4)  tipo ='A';
    if ( j==5)  tipo ='F';
    if ( j==6)  tipo ='G';
    
    println("El valor es ", j);
  }
}
