Minim minim;
AudioInput in;


void setAudio(){
  // get a line in from Minim, default bit depth is 16
  minim = new Minim(this);
  //minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, width/2);
  println("Buffersize audio in: " + in.bufferSize());
}