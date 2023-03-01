PImage _img;
float _noiseScale;


void setup() {
  _img = loadImage("haru.jpg"); 
  _noiseScale = 0.005;
  size(1920, 1080); 
  background(255);
  frameRate(60);
}


void draw() {
  for (int i = 0; i < 300; i++) {
    float x = random(_img.width);
    float y = random(_img.height);
    color col = _img.get(int(x), int(y));
    float noiseFactor = noise(x*_noiseScale, y*_noiseScale);
    println(noiseFactor);
    float lineLength = noiseFactor;
    pushMatrix();
    translate(x, y);
    rotate(noiseFactor * radians(180));
    stroke(col);
    strokeWeight(8);
    line(0, 0, lineLength, lineLength);
    popMatrix();
  }
  saveFrame("img/generative_####.png");
}
