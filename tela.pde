//physics system for mesh
VPhysicsSimple physics;
//physics for constraints
VPhysicsSimple physicsConstraints;


void createMesh(){
    physics = new VPhysicsSimple();
  BConstantForce force = new BConstantForce(0, 0, .01f);
  physics.addBehavior(force);

  physicsConstraints = new VPhysicsSimple();
  physicsConstraints.addBehavior(new BAttraction(new Vec(), 1000, 1f));

  //lock all the Constraints (otherwise the springforce will alter the position
  VParticle a1 = new VParticle(0 , 0 ).lock();
  VParticle a2 = new VParticle(width, 0 ).lock();
  VParticle b1 = new VParticle(0 , height ).lock();
  VParticle b2 = new VParticle(width , height ).lock();

  //add the Particles as Constraints to the mesh physics
  physics.addConstraint(a1);
  physics.addConstraint(a2);
  physics.addConstraint(b1);
  physics.addConstraint(b2);

  //add the Particles as Particles to the constraint physics
  physicsConstraints.addParticle(a1);
  physicsConstraints.addParticle(a2);
  physicsConstraints.addParticle(b1);
  physicsConstraints.addParticle(b2);

  //create a mesh
  float amountX = 40;
  float amountY = 8;//9 - 18

  float strength = 1f;
  ArrayList<VParticle> particles = new ArrayList<VParticle>();

  for (int i = 0; i <= amountY; i++) {
    Vec a0 = a1.interpolateTo(b1, i / amountY);
    Vec b0 = a2.interpolateTo(b2, i / amountY);

    for (int j = 0; j <= amountX; j++) {
      Vec pos = a0.interpolateTo(b0, j / amountX);
      VParticle p = physics.addParticle(new VParticle(pos));
      if (i % 2 == 0)
        p.setRadius(10);
      else
        p.setRadius(1);
      
      particles.add(p);

      if (j > 0) {
        //getParticle gives you the equal particle or constraint 
        VParticle previous = physics.getParticle(particles.get(particles.size() - 2));
        VSpring s = new VSpring(p, previous, p.sub(previous).mag(), strength);
        physics.addSpring(s);
      }
      if (i > 0) {
        VParticle above = physics.getParticle(particles.get(particles.size() - (int) amountX - 2));
        VSpring s = new VSpring(p, above, p.sub(above).mag(), strength);
        physics.addSpring(s);
      }
    }
  }
}

void modifyMesh() {
  for (VParticle p : physics.particles) {
    if (p.getRadius() == 10 ) p.z = mouseY;
  }
}

void updateMesh() {
  physics.update();
  // before you update you have to unlock the constarints
  for (VParticle c : physicsConstraints.particles) {
    //c.unlock();
    //if you have just local forces
    c.update();
    c.lock();
  }
  //if you have forces attached to the physics class update so
  physicsConstraints.update();
  for (VParticle c : physicsConstraints.particles) {
    c.lock();
  }
}

void drawMesh() {
  strokeWeight(2);
  for (VParticle p : physics.particles) {
    //stroke(p.z*2);
    if (p.getRadius() == 10 )
      stroke (100, 255, 100);
    else
      stroke (100, 100, 255);
    point(p.x, p.y, p.z);
  }

  //strokeWeight(5);
  stroke(200, 0, 0);
  for (VParticle p : physics.constraints) {
    point(p.x, p.y, p.z);
  }
}