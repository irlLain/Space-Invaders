PImage background;
int bgX=0; //global variable background location
final color Alien1Color = color(0, 225, 0);
final color Alien2Color = color(50, 100, 0);
//constant alien colours stored as variables
boolean bulletpresent = false;
ArrayList<Bullet> BulletList;
int playerscore = 0;
boolean AlienPresent = false;
ArrayList<Alien> AlienList;
//Creates arrays to store instances of aliens and bullets
Defender PLAYER1 = new Defender();
Bullet player1_bullet = new Bullet(PLAYER1.x, PLAYER1.y);


void setup()
{
  size(800, 400);
  background = loadImage("spaceBackground.jpg");
  background.resize(width, height);
  //set image to be same size as the canvas
  BulletList = new ArrayList<Bullet>();
  AlienList = new ArrayList<Alien>();
  AlienList.add( new Alien(700, 25, Alien1Color, Alien2Color));
  AlienList.add( new Alien(700, 125, Alien1Color, Alien2Color));
  AlienList.add( new Alien(700, 75, Alien1Color, Alien2Color));
  //Creates the first 3 instances of aliens
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      PLAYER1.y = PLAYER1.y - 5;
    }
    //moves defender up if up arrow is pressed
    if (keyCode == DOWN)
    {
      PLAYER1.y = PLAYER1.y + 5;
    }
    //moves defender down if down arrow is pressed
    if (keyCode == RIGHT)
    {
      BulletList.add(new Bullet(PLAYER1.x+65, PLAYER1.y));
      bulletpresent = true;
      player1_bullet = new Bullet(PLAYER1.x, PLAYER1.y);
    }
    //if the right arrow key is pressed a bullet is fired and added to the array
  }
}

void PositionCheck()
{
  if (PLAYER1.y  < 0)
  {
    PLAYER1.y = 0;
  }
  if (PLAYER1.y >= height-40)
  {
    PLAYER1.y = height-40;
  }
  //Prevents the player from going off the screen
}

void GameOver()
{
  print("Game Over!! Score: " +playerscore);
  System.exit(0);
  //Ends the game and displays a game over message and the players final score
}

void draw ()
{
  //scrolling background image
  image(background, bgX, 0); //draw image to fill the canvas
  //draw image again off the right of the canvas
  image(background, bgX+background.width, 0);
  bgX = bgX- 2;
  if (bgX == -background.width) //if first image completely off the canvas
  {
    bgX=0; //reset back to initial value background
  }
  for (int c = 0; c <= height; c++)
    //creates a crashed line infront of the defender
  {
    point(80, c);
  }

  PLAYER1.render();
  //renders the players movements

  for (int i = AlienList.size()-1; i >= 0; i--)
  {
    Alien present = AlienList.get(i);
    present.render();
  }
  //renders the aliens for each alien in the array list

  for (int i = BulletList.size()-1; i >= 0; i--)
  {
    Bullet fired = BulletList.get(i);
    fired.render();
    if (fired.x > width)
    {
      BulletList.remove(fired);
      //if the bullet goes off the screen it's removed from the array
    }
  }
  //renders the bullets for each bullet in the array list

  PositionCheck();
  //checks players position
  PLAYER1.Crash();
  //checks if the aliens have hit the player
  hit();
  //checks if the bullets have hit an alien
  textSize(20);
  fill(76, 245, 76);
  text("Player score = "+playerscore, 10, 30);
  //displays the players score


  if (PLAYER1.Crash() == true)
  {
    GameOver();
    //if the alien has hit the player, results in a game over
  }
}

void hit()
{
  for (int k = BulletList.size()-1; k>=0; k--)
  {
    Bullet fired = BulletList.get(k);
    //goes through each bullet in the array to check for a hit
    for (int c = AlienList.size()-1; c >= 0; c--)
    {
      Alien present = AlienList.get(c);
      //goes through each alien in the array to check for a hit
      if (dist(fired.x, fired.y, present.x, present.y)< 30)
      {
        BulletList.remove(fired);
        AlienList.remove(present);
        //if the alien has been hit, both the bullet and alien are removed
        AlienList.add( new Alien(700, 25, Alien1Color, Alien2Color));
        //replaces the hit alien and creates an instant of a new one
        playerscore = playerscore+10;
        //adds points to the players score.
      }
    }
  }
}
