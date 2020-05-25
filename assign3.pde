final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
final int soilSpacing=80;

int soil0X,soil0Y,soil1X,soil1Y,soil2X,soil2Y,soil3X,soil3Y,soil4X,soil4Y,soil5X,soil5Y;
float groundhogX=320;
float groundhogY=80;
int frame=0;
float groundhogX2,groundhogY2;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24;
PImage soil0,soil1,soil2,soil3,soil4,soil5;
PImage stone1,stone2;
PImage life;
PImage groundhogDown,groundhogIdle,groundhogLeft,groundhogRight;

int lifeX1=10;
int lifeX2=80;
int lifeX3=150;
int lifeX4=220;
int lifeX5=290;
int lifeY=10;


boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
  soil0=loadImage("img/soil0.png");
  soil1=loadImage("img/soil1.png");
  soil2=loadImage("img/soil2.png");
  soil3=loadImage("img/soil3.png");
  soil4=loadImage("img/soil4.png");
  soil5=loadImage("img/soil5.png");
  stone1=loadImage("img/stone1.png");
  stone2=loadImage("img/stone2.png");
  life=loadImage("img/life.png");
  groundhogDown=loadImage("img/groundhogDown.png");
  groundhogIdle=loadImage("img/groundhogIdle.png");
  groundhogLeft=loadImage("img/groundhogLeft.png");
  groundhogRight=loadImage("img/groundhogRight.png");
  
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		//image(soil8x24, 0, 160);
    for(int i=0; i< 8;i++){
      for(int j=0;j<4;j++){
        soil0X=i*soilSpacing;
        soil0Y=160+j*soilSpacing;
        image(soil0,soil0X,soil0Y);
        soil1X=i*soilSpacing;
        soil1Y=160+320+j*soilSpacing;
        image(soil1,soil1X,soil1Y);
        soil2X=i*soilSpacing;
        soil2Y=160+320*2+j*soilSpacing;
        image(soil2,soil2X,soil2Y);
        soil3X=i*soilSpacing;
        soil3Y=160+320*3+j*soilSpacing;
        image(soil3,soil3X,soil3Y);
        soil4X=i*soilSpacing;
        soil4Y=160+320*4+j*soilSpacing;
        image(soil4,soil4X,soil4Y);
        soil5X=i*soilSpacing;
        soil5Y=160+320*5+j*soilSpacing;
        image(soil5,soil5X,soil5Y);
        }
        }
    
    for (int i=0;i<8;i++){
      int stoneX =i*soilSpacing;
      int stoneY =160+i*soilSpacing;
      image (stone1,stoneX,stoneY);
    }
    
    
    for(int i=0; i<=9; i++){
        for(int j=10; j<18; j++){
          if(i%4 == 1 || i%4 ==2){
            
            if(j%4 == 1 || j%4 ==2){
              image(stone1, soilSpacing*i, soilSpacing*j);
            }else if(j%4 == 0 || j%4 == 3){
              image(stone1, soilSpacing*i-soilSpacing*2, soilSpacing*j);
            }
            
          }
        }
      }
      
      
      for(int i=0; i<=9; i++){
        for(int j=18; j<26; j++){
          
          if(i%3 == 1 || i%3 == 2){
           
            if(j%3 == 0){
             image(stone1, soilSpacing*i, soilSpacing*j);
            }else if(j%3 == 1){
             image(stone1, soilSpacing*i-soilSpacing, soilSpacing*j);
            }else{
             image(stone1, soilSpacing*i-soilSpacing*2, soilSpacing*j);
            }
           
          }
          
          if(i%3 == 2){
            
            if(j%3 ==0){
              image(stone2, soilSpacing*i, soilSpacing*j);
            }else if(j%3 ==1){
              image(stone2, soilSpacing*i-soilSpacing, soilSpacing*j);
            }else{
              image(stone2,soilSpacing*i-soilSpacing*2, soilSpacing*j);
            }
            
          }
          
        }
      }
      
    
    
    
    
    
    
    
		// Player

    if(downPressed==false&&leftPressed==false&&rightPressed==false){
      image(groundhogIdle,groundhogX,groundhogY);
    }
    if(downPressed){
        frame++;
        if(frame>0 && frame<15){
          groundhogY+=soilSpacing/15.0;        
          image(groundhogDown,groundhogX,groundhogY);
      }else{
        groundhogY=groundhogY2+soilSpacing;
        downPressed = false;
      }
      }
        
      if(leftPressed){
        frame++;
        if(frame>0 && frame<15){
          groundhogX-=soilSpacing/15.0;                
          image(groundhogLeft,groundhogX,groundhogY);
      }else{
        groundhogX=groundhogX2-soilSpacing;
        leftPressed = false;
      }
      }
        
      if(rightPressed){
        frame++;
        if(frame>0 && frame<15){
          groundhogX+=soilSpacing/15.0;
          image(groundhogRight,groundhogX,groundhogY);
      }else{
        groundhogX=groundhogX2+soilSpacing;
        rightPressed = false;
      }
      }

		// Health UI
    
    if(playerHealth==0){
        gameState = GAME_OVER;
      }
      if(playerHealth==1){
        image(life,lifeX1,lifeY);
      }
      if(playerHealth==2){
        image(life,lifeX1,lifeY);
        image(life,lifeX2,lifeY);
      }
      if(playerHealth==3){
        image(life,lifeX1,lifeY);
        image(life,lifeX2,lifeY);
        image(life,lifeX3,lifeY);
      }
      if(playerHealth==4){
        image(life,lifeX1,lifeY);
        image(life,lifeX2,lifeY);
        image(life,lifeX3,lifeY);
        image(life,lifeX4,lifeY);
      }
      if(playerHealth==5){
        image(life,lifeX1,lifeY);
        image(life,lifeX2,lifeY);
        image(life,lifeX3,lifeY);
        image(life,lifeX4,lifeY);
        image(life,lifeX5,lifeY);
      }

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
        downPressed = false;
        leftPressed = false;
        rightPressed = false;
				gameState = GAME_RUN;

        playerHealth=2;
        groundhogX=soilSpacing*4;
        groundhogY=soilSpacing;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

float nowTime,lastTime;

void keyPressed(){
	// Add your moving input code here
    nowTime = millis();  
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
     
      
      case DOWN:
      if(nowTime - lastTime >  250){ 
        downPressed = true;
        frame = 0;
        groundhogY2=groundhogY;            
        lastTime = nowTime;
    }
        break;
      case LEFT:
        if(nowTime - lastTime >  250){ 
        leftPressed = true;
        frame = 0;
        groundhogX2=groundhogX;             
        lastTime = nowTime;
    }
        break;
      case RIGHT:
        if(nowTime - lastTime >  250){ 
        rightPressed = true;
        frame = 0;
        groundhogX2=groundhogX;
              
        lastTime = nowTime;
    }
        break;
      
       
    }
  }
  
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
