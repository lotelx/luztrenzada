/*
 Codigo de la Instalacion Interactiva
 Cuerda de Onda
 por Lot Amorós.
 http://feenelcaos.org
 Codigo bajo licencia GNU GPL v3
 */


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

void loadPositions() {
  String[] lines = loadStrings("positions.txt");
  int index = 0;
  while (index < lines.length) {
    cuerdasL[index].setPosition(int(lines[index]));
    cuerdasR[index].setPosition(int(lines[index]));
    index = index + 1;
  }
  println("Posición de cuerdas cargada.");
}

void savePositions() {
  String[] lines = new String[12];
  for (int i = 0; i < 12; i++) {
    lines[i] = nf(cuerdasL[i].getPosition(), 3); //+ "\t" + y[i];
  }
  saveStrings("positions.txt", lines);
  println("Posición de cuerdas guardada.");
}

public class Cuerda {
  int x=0;  //xposition
  int h=0;  //height
  int position=0;  //Position for draw
  int vtam = 300;  //height of wave for draw
//  int hueLine = 0;

  float hueMin=0;
  float hueMax=0;
  
  boolean right=false;

  public Cuerda() {
    x=0;  //xposition
    h=0;  //height
    position=0;  //Position for draw
    vtam = 300;
    hueMin=0;
    hueMax=0;
  }
  
  public void setRight(){
    right=true;
  }

  float hueForSample( float sample )
  {
    //120,+330
    hueMax = hueMin+200;
   // if (colorMax>365) colorMax = colorMax - 365;
    return map( abs(sample), 0, 1, hueMin, hueMax );
  }

  void setHue(int h) {
    hueMin = h;
  }

  void setPosition(int p) {
    println("Set position of cuerda in: " + p);
    position = p;
  }

  int getPosition() {
    return position;
  }

  // draw is run many times
  void draw()
  {
    // noize.setTint( Noise.Tint.WHITE );
    // draw the waveforms
    // draw a line from one buffer position to the next for both channels
    //stroke(100, 0, 255);

    if (right)
    for (int i = 0; i < tablaR.length - 1; i++)
    {
      //stroke( hueForSample(in.left.get(i)), 100, 100 );
      //line(i, position + in.left.get(i)*vtam, i+1, position + in.left.get(i+1)*vtam);
      stroke( hueForSample(tablaR[i]), 100, 100 );
      line(i+tablaR.length, position + tablaR[i]*vtam, i+tablaR.length+1, position + tablaR[i+1]*vtam); 
    }
    else
    for (int i = 0; i < tablaL.length - 1; i++)
    {
      //stroke( hueForSample(in.left.get(i)), 100, 100 );
      //line(i, position + in.left.get(i)*vtam, i+1, position + in.left.get(i+1)*vtam);
      stroke( hueForSample(tablaL[i]), 100, 100 );
      line(i, position + tablaL[i]*vtam, i+1, position + tablaL[i+1]*vtam); 
    }
      line(tablaL.length-1, position + tablaL[tablaL.length-1]*vtam, tablaL.length, position + tablaL[tablaL.length-1]*vtam);     
  }
  
}