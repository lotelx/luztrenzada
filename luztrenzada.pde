/*
 Codigo de la Instalacion Interactiva Luz trenzada
 por Lot Amorós.
 http://feenelcaos.org
 Codigo bajo licencia GNU GPL v3
 
 https://groups.google.com/forum/?hl=en&fromgroups=#!searchin/beadsproject/multiple$20audio$20input/beadsproject/dSvxUM1l9S0/SVd8jTLHIYwJ
 http://code.compartmental.net/tools/minim/quickstart/
 */

import ddf.minim.*;
import punktiert.math.Vec;
import punktiert.physics.*;

Cuerda[] cuerdasL;
Cuerda[] cuerdasR;
float[] tablaL;
float[] tablaR;

void setup()
{
  //3200 * 1800 lenovo
  //1440 X 900 MacBook
  //size(1440, 900,P3D);
  fullScreen(P3D);
  smooth();
  //Modelo de color de 360 grados y 100%, 100%
  colorMode(HSB, 360, 100, 100);

  cuerdasL = new Cuerda[12];
  cuerdasR = new Cuerda[12];
  tablaL = new float[width/2];
  tablaR = new float[width/2];

  setAudio();
  setCuerdas();
  createMesh();
}

void draw()
{
  background(0, 240);
  /* fill(0, 50); 
   noStroke(); 
   rect(0, 0, width, height);
   stroke(255);*/

  updateTables();
  modifyMesh();
  updateMesh();
  drawMesh();  

  for (int k=0; k<cuerdasL.length; k++) {
    cuerdasL[k].draw();
    cuerdasR[k].draw();
  }
}

void updateTables() {
  for (int k=0; k<tablaL.length; k++) {
    tablaL[k]=in.left.get(k)*10;
    tablaR[k]=in.right.get(k)*10;
  }
}

void drawMeta() {
  // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
  }
}

void keyPressed() {  
  switch(key) {
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
    cuerdasR[8].setPosition(mouseY);
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

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}