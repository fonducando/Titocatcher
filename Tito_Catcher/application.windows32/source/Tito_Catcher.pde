import processing.sound.*;

int FrameRate = 60;
float XDirection, YDirection;
int Difficulty = 1;
int Speed = 1;;
float EngineerLocX, EngineerLocY;
int Score = 0;
PImage EngineerPic;
PImage BGImage;
int Timer = 60;
int CurrentFrame = 0;
int GameMode = 0;


int StartButtonX = 750;
int StartButtonY = 50;
int StartButtonWidth = 400;
int StartButtonHeight = 200;
SoundFile PopSound;
SoundFile BGMusic;

 
void setup()
{
 PopSound = new SoundFile(this, "pop.mp3");
 BGMusic = new SoundFile(this, "BGMusic.mp3");
 frameRate(FrameRate);
 size(1920,1080);
 EngineerPic = loadImage("EngineerPic.jpg");
 BGImage = loadImage("EngineerPicL.jpg");
 EngineerLocX = 1;
 EngineerLocY = 1;
 textSize(32);
 XDirection = 1;
 YDirection = 1;
 
}




void draw()
{
if (GameMode == 1)
{
  
  background(200,200,255);
  image(EngineerPic, EngineerLocX, EngineerLocY);
  

  CheckEngineerHover();

  if(XDirection <= 1)
  {
  EngineerLocX = EngineerLocX + (1 * Speed);
  if((EngineerLocX + 200) > 1920)
    {
      XDirection = 2;
    }
  }
  
  if((XDirection > 1) && (XDirection <= 2))
  {
  EngineerLocX = EngineerLocX - (1 * Speed);
  if(EngineerLocX < 0)
    {
      XDirection = 1;
    }
  }
  
    if(YDirection <= 1)
  {
  EngineerLocY = EngineerLocY + (1 * Speed);
  if((EngineerLocY + 200) > 1080)
    {
      YDirection = 2;
    }
  }
  
  if((YDirection > 1) && (YDirection <= 2))
  {
  EngineerLocY = EngineerLocY - (1 * Speed);
  if(EngineerLocY < 0)
    {
      YDirection = 1;
    }
  }

  
  text(("Score " + Score), 800, 1050);
  text(("Timer " + Timer), 800, 50); 
 
  CurrentFrame = CurrentFrame + 1;
  if (CurrentFrame == 60)
    {
      
      Timer = Timer - 1;
      CurrentFrame = 0;
      XDirection = random(0,2);
      YDirection = random(0,2);
      if (Timer == 0)
        {
        GameMode = 0;
        }
    }
}






if (GameMode == 0)
{
  if(CheckStartButtonHover() == true)
    {
      fill(0,200,200);
    }
      else
    {
      fill(255,255,255);
    }

background(BGImage);
rect(StartButtonX,StartButtonY,StartButtonWidth,StartButtonHeight);
fill(0);
text("Start",(StartButtonX + 150),(StartButtonY + 125));
text(("You have caught " + Score + " Titos!"), 800, 1050);
  
  
 
  
  
}

}



boolean CheckEngineerHover()
{
  if ((mouseX >= (EngineerLocX - 5) && mouseX <=(EngineerLocX + 205))  && (mouseY >= (EngineerLocY - 5) && mouseY <= (EngineerLocY + 205 ))) 
    {    
      XDirection = random(0,2);
      YDirection = random(0,2);
    }  
    
  if ((mouseX >= EngineerLocX && mouseX <=(EngineerLocX + 200))  && (mouseY >= EngineerLocY && mouseY <= (EngineerLocY + 200 ))) 
    {
      println("Hovering"); 
    
      if(mousePressed == true)
      {
       PopSound.play();
       Score = Score + 1;
       Speed = Speed + 1;
       XDirection = random(0,2);
       YDirection = random(0,2);
       EngineerLocX = random(1,1820);
       EngineerLocY = random(1,980); 
      }
    
    return true;
    } 
    else 
    {
      return false;
    }

}

 boolean CheckStartButtonHover()
{
  if ((mouseX >= StartButtonX && mouseX <=(StartButtonX + StartButtonWidth))  && (mouseY >= StartButtonY && mouseY <= (StartButtonY + StartButtonHeight))) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
}

void mouseClicked()
{
  if (GameMode == 0)
  {
    if (CheckStartButtonHover() == true)
    {
      BGMusic.play();
      GameMode = 1;
      Timer = 60;
      Speed = 1;
      Score = 0;
      CurrentFrame = 0;
    }
  }
}
