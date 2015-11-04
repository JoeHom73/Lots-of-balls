//declare variables
int count = 2000; //number of balls 
float []x = new float [count];
float []y= new float [count];
float []velX = new float [count];
float []velY = new float [count];
float []diam = new float [count];


void setup() {
  //set size of canvas
  size(1000, 800);
  background(0);
  //initialize variables
  for (int i=0; i < count; i++) {
    x[i] = 0;
    y[i] = 0;
    diam[i] = random(5, 15);
    velX[i] = random(-15, 15);
    velY [i]= random(-5, 5); 
    velX [i]= random(-15, 15);
    velY [i]= random(-5, 5);
    noStroke();
    colorMode(HSB, 360, 100, 100, 100);
   
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  for (int i=0; i < count; i++) {
    fill(random(360), random(100), random(100), random(100)); //ball color 
    ellipse(x[i], y[i], diam[i], diam[i]); //balls with random sizes for fun :) 


    //add velocity to position
    x[i] += velX[i]; //x velcoity 
    y[i] += velY[i]; //y velcoity 

    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]*2);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]*2);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]*.25);
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]*2);
    }
  }
}