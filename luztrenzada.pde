/*
 Codigo de la Instalacion Interactiva Luz trenzada
 por Lot Amorós.
 http://feenelcaos.org
 Codigo bajo licencia GNU GPL v3
 
 https://groups.google.com/forum/?hl=en&fromgroups=#!searchin/beadsproject/multiple$20audio$20input/beadsproject/dSvxUM1l9S0/SVd8jTLHIYwJ
 http://code.compartmental.net/tools/minim/quickstart/
 */

import ddf.minim.*;
Minim minim;
AudioInput in;

Cuerda[] cuerdasL = new Cuerda[12];
Cuerda[] cuerdasR = new Cuerda[12];
float[] tablaL = new float[1500];
float[] tablaR = new float[1500];

void setup()
{
  //3200 * 1800 lenovo
  size(3000, 1700);
  //smooth();
  //fullScreen();
  //Modelo de color de 360 grados y 100%, 100%
  colorMode(HSB, 360, 100, 100);

  // get a line in from Minim, default bit depth is 16
  minim = new Minim(this);
  //minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, width/2);
  println("Buffersize audio in: " + in.bufferSize());
  
 setCuerdas();
}

  //Set up the lines
  void setCuerdas(){
  for (int k=0;k<cuerdasL.length;k++) {
    cuerdasL[k] = new Cuerda();
  }  
  for (int k=0;k<cuerdasR.length;k++) {
    cuerdasR[k] = new Cuerda();
  }
  setDefaultValues();
  loadPositions();
}
  
  void setDefaultValues(){
  cuerdasL[0].setPosition(100);
  cuerdasL[1].setPosition(125);
  cuerdasL[2].setPosition(150);

  cuerdasL[3].setPosition(250);
  cuerdasL[4].setPosition(275);
  cuerdasL[5].setPosition(300);

  cuerdasL[6].setPosition(400);
  cuerdasL[7].setPosition(425);
  cuerdasL[8].setPosition(450);

  cuerdasL[9].setPosition(550);
  cuerdasL[10].setPosition(575);
  cuerdasL[11].setPosition(600);

  cuerdasL[0].setHue(25);
  cuerdasL[1].setHue(50);
  cuerdasL[2].setHue(75);

  cuerdasL[3].setHue(100);
  cuerdasL[4].setHue(125);
  cuerdasL[5].setHue(150);

  cuerdasL[6].setHue(200);
  cuerdasL[7].setHue(225);
  cuerdasL[8].setHue(250);

  cuerdasL[9].setHue(300);
  cuerdasL[10].setHue(325);
  cuerdasL[11].setHue(350);

  cuerdasR[0].setPosition(100);
  cuerdasR[1].setPosition(125);
  cuerdasR[2].setPosition(150);

  cuerdasR[3].setPosition(250);
  cuerdasR[4].setPosition(275);
  cuerdasR[5].setPosition(300);

  cuerdasR[6].setPosition(400);
  cuerdasR[7].setPosition(425);
  cuerdasR[8].setPosition(450);

  cuerdasR[9].setPosition(550);
  cuerdasR[10].setPosition(575);
  cuerdasR[11].setPosition(600);

  cuerdasR[0].setHue(25);
  cuerdasR[1].setHue(50);
  cuerdasR[2].setHue(75);

  cuerdasR[3].setHue(100);
  cuerdasR[4].setHue(125);
  cuerdasR[5].setHue(150);

  cuerdasR[6].setHue(200);
  cuerdasR[7].setHue(225);
  cuerdasR[8].setHue(250);

  cuerdasR[9].setHue(300);
  cuerdasR[10].setHue(325);
  cuerdasR[11].setHue(350);
  
  for (int k=0;k<cuerdasR.length;k++)
    cuerdasR[k].setRight();
  }

void draw()
{
  background(0);
 /* fill(0, 50); 
  noStroke(); 
  rect(0, 0, width, height);
  stroke(255);*/


updateTables();

  for (int k=0;k<cuerdasL.length;k++) {
    
    cuerdasL[k].draw();
    cuerdasR[k].draw();
  }
}

void updateTables(){
 for (int k=0;k<tablaL.length;k++) {
    tablaL[k]=in.left.get(k);
    tablaR[k]=in.right.get(k);
 }
}

void drawMeta(){
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
  }

}

void keyPressed(){  
  switch(key){
  case '1':
    cuerdasL[0].setPosition(mouseY);
    cuerdasR[0].setPosition(mouseY);
    break;
  case '2':
    cuerdasL[1].setPosition(mouseY);
    cuerdasR[1].setPosition(mouseY);
    break;
  case '3':
    cuerdasL[2].setPosition(mouseY);
    cuerdasR[2].setPosition(mouseY);
    break;
  case '4':
    cuerdasL[3].setPosition(mouseY);
    cuerdasR[3].setPosition(mouseY);
    break;
  case '5':
    cuerdasL[4].setPosition(mouseY);
    cuerdasR[4].setPosition(mouseY);
    break;
  case '6':
    cuerdasL[5].setPosition(mouseY);
    cuerdasR[5].setPosition(mouseY);
    break;
  case '7':
    cuerdasL[6].setPosition(mouseY);
    cuerdasR[6].setPosition(mouseY);
    break;
  case '8':
    cuerdasL[7].setPosition(mouseY);
    cuerdasR[7].setPosition(mouseY);
    break;
  case '9':
    cuerdasL[8].setPosition(mouseY);
    cuerdasR[7].setPosition(mouseY);
    break;
  case '0':
    cuerdasL[9].setPosition(mouseY);
    cuerdasR[9].setPosition(mouseY);
    break;
  case 'q':
    cuerdasL[10].setPosition(mouseY);
    cuerdasR[10].setPosition(mouseY);
    break;
  case 'w':
    cuerdasL[11].setPosition(mouseY);
    cuerdasR[11].setPosition(mouseY);
    break;
    
  case 'a':
    loadPositions();
    break;
  case 's':
    savePositions();
    break;

  }
}

void loadPositions(){
  String[] lines = loadStrings("positions.txt");
  int index = 0;

  while (index < lines.length) {
    cuerdasL[index].setPosition(int(lines[index]));
    cuerdasR[index].setPosition(int(lines[index]));
    
    index = index + 1;
  }
  println("Posición de cuerdas cargada.");
}


void savePositions(){
  String[] lines = new String[12];
  for (int i = 0; i < 12; i++) {
    lines[i] = nf(cuerdasL[i].getPosition(),3); //+ "\t" + y[i];
  }
  saveStrings("positions.txt", lines);
  println("Posición de cuerdas guardada.");
}


 void stop()
 {
 // always close Minim audio classes when you are done with them
 in.close();
 minim.stop();
 
 super.stop();
 }