import java.util.*;

int matrix[][] = new int[4][4];
int offset = 10;
boolean DEBUG = false;

int score;

Random r = new Random();

void setup()
{
  size(500, 550);
  background(51);
  focused = true;
  matrix[r.nextInt(4)][r.nextInt(4)] = (r.nextInt(2)+1)*2;
}

void draw()
{
  background(51);
  updateMatrix();
  updateScore();
}

void updateMatrix()
{
  if (DEBUG)
  {
    debugMatrix();
  }
  float x;
  float y;
  float l = width/4-offset*2;

  for (int i = 0; i < 4; i++)
    for (int j = 0; j < 4; j++)
    {
      x = offset+width/4*j;
      y = offset+(height-50)/4*i + 50;
      fill(getColor(matrix[i][j]), 255, 255);
      noStroke();
      rect(x, y, width/4-offset*2, (height-50)/4-offset*2);
      if (matrix[i][j] != 0)
      {
        fill(0);
        textSize(28);
        textAlign(CENTER, CENTER);
        text(matrix[i][j], x+l/2, y+l/2-4);
      }
    }
}

void keyReleased()
{
  boolean didMove = false;
  boolean empty = true;
  int i;
  int j;
  if (key == CODED && (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT)) 
  {
    if (keyCode == UP) 
    {
      for (int t = 0; t < 3; t++)
        for (i = 1; i < 4; i++)
          for (j = 0; j < 4; j++)
          {
            if (matrix[i-1][j] == 0)
            {
              matrix[i-1][j] = matrix[i][j];              
              matrix[i][j] = 0;
              didMove = true;
            }
            if (matrix[i-1][j] == matrix[i][j])
            {
              matrix[i-1][j] += matrix[i][j];              
              matrix[i][j] = 0;
              didMove = true;
            }
          }
    }
    if (keyCode == DOWN) 
    {
      for (int t = 0; t < 3; t++)
        for (i = 0; i < 3; i++)
          for (j = 0; j < 4; j++)
          {
            if (matrix[i+1][j] == 0)
            {
              matrix[i+1][j] = matrix[i][j];              
              matrix[i][j] = 0;
              didMove = true;
            }
            if (matrix[i+1][j] == matrix[i][j])
            {
              matrix[i+1][j] += matrix[i][j];              
              matrix[i][j] = 0;
              didMove = true;
            }
          }
    }
    if (keyCode == LEFT) 
    {
      for (int t = 0; t < 3; t++)
        for (i = 0; i < 4; i++)
          for (j = 1; j < 4; j++)
          {
            if (matrix[i][j-1] == 0)
            {
              matrix[i][j-1] = matrix[i][j];              
              matrix[i][j] = 0;
              didMove = true;
            }
            if (matrix[i][j-1] == matrix[i][j])
            {
              matrix[i][j-1] += matrix[i][j];              
              matrix[i][j] = 0;
              didMove = true;
            }
          }
    }
    if (keyCode == RIGHT) 
    {
      for (int t = 0; t < 3; t++)
        for (i = 0; i < 4; i++)
          for (j = 0; j < 3; j++)
          {
            if (matrix[i][j+1] == 0)
            {
              matrix[i][j+1] = matrix[i][j];              
              matrix[i][j] = 0;
              didMove = true;
            }
            if (matrix[i][j+1] == matrix[i][j])
            {
              matrix[i][j+1] += matrix[i][j];              
              matrix[i][j] = 0;
              didMove = true;
            }
          }
    }
    if (!didMove)
    {
      for (i = 0; i < 4; i++)
        for (j = 0; j < 4; j++)
          if (matrix[i][j] != 0)
          {
            empty = false;
          }
      if (empty == false)
        for (i = 0; i < 4; i++)
          for (j = 0; j < 4; j++)
            matrix[i][j] = 0;
    }
    do
    {
      i = r.nextInt(4);
      j = r.nextInt(4);
    }
    while (matrix[i][j] != 0);
    matrix[i][j] = (r.nextInt(2)+1)*2;
  }
}

void updateScore()
{
  score = 0;
  for (int i = 0; i < 4; i++)
    for (int j = 0; j < 4; j++)
      score += matrix[i][j];
  fill(255);
  textSize(24);
  textAlign(LEFT, TOP);
  text("Score: " + score, 10, 10);
}

int getColor(int value)
{
  colorMode(RGB);
  if (value == 0)
    return 235;
  colorMode(HSB);  
  return (int)sqrt(value)*5;
}

void debugMatrix()
{
  matrix[0][0] = 2;
  matrix[1][0] = 4;
  matrix[2][0] = 8;
  matrix[3][0] = 16;
  matrix[0][1] = 32;
  matrix[1][1] = 64;
  matrix[2][1] = 128;
  matrix[3][1] = 256;
  matrix[0][2] = 512;
  matrix[1][2] = 1024;
  matrix[2][2] = 2048;
  matrix[3][2] = 4096;
  matrix[0][3] = 32000;
  matrix[1][3] = 0;
  matrix[2][3] = 0;
  matrix[3][3] = 0;
}
