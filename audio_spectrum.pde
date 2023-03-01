import ddf.minim.*;
PImage img;

Minim minim;
AudioPlayer player;
int lr=0;
int ll=0;
void setup()
{
  frameRate(60);
  size( 960, 480, P2D);
  minim=new Minim(this);
  player=minim.loadFile("sample.mp3");
  player.loop();
  img = loadImage("music.png");
}

void draw()
{
  image(img, 0, 0);
  //background(0);
  fill(0);
  ellipse(width/3, height/2, width/3+30, width/3+30);
  ellipse(width/3*2, height/2, width/3+30, width/3+30);
  fill(255, 255, 255);
  ellipse(width/3, height/2, width/3, width/3);
  ellipse(width/3*2, height/2, width/3, width/3);
  fill(0);
  float radiusL=player.left.level() * width*0.7;
  int rL=int(radiusL);
  float radiusR=player.right.level() * width*0.7;
  int rR=int(radiusR);
  smooth();
  float radius = 100;
  int centX = width/3;
  int centY = height/2;
  stroke(0, 30);
  noFill();
  stroke(20, 50, 70);
  strokeWeight(1);
  float x, y;
  float noiseval = random(10);
  if ((lr!=rR)||(ll!=rL)) {
    beginShape();
    fill(0);
    for (float ang = 0; ang <= 360; ang += 1.5) {
      noiseval += 0.1;
      float radVariance = 30 * customNoise(noiseval);
      float thisRadius = radius + radVariance;
      float rad = radians(ang);
      x = centX + (thisRadius * cos(rad))*rL/200;
      y = centY + (thisRadius * sin(rad))*rL/200;
      curveVertex(x, y);
    }
    endShape();
    centX=width/3*2;
    noiseval = random(10);
    beginShape();
    for (float ang = 0; ang <= 360; ang += 1.5) {
      noiseval += 0.1;
      float radVariance = 30 * customNoise(noiseval);
      float thisRadius = radius + radVariance;
      float rad = radians(ang);
      x = centX + (thisRadius * cos(rad))*rR/200;
      y = centY + (thisRadius * sin(rad))*rR/200;
      curveVertex(x, y);
    }
    endShape();
  }
}
float customNoise(float value) {
  int count=int(value%6);
  float retValue = pow(sin(value), count);
  return retValue;
}
