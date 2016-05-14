/*
 Codigo de la Instalacion Interactiva
 Cuerda de Onda
 por Lot Amorós.
 http://feenelcaos.org
 Codigo bajo licencia GNU GPL v3
 */

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

 /* void updateWave(String msj) {
    String[] lista = split(msj, ' ');
    for (int k=0;k<lista.length;k++)
      tabla[k] = Float.parseFloat(lista[k]);
  }*/

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
  }
  
}