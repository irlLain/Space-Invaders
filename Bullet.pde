class Bullet
{
  int x;
  int y;
  int speedX = 1;
  //needed variables for the bullet class

  Bullet(int x, int y)
  {
    this.x = 65;
    this.y = PLAYER1.y;
    this.speedX = 5;
  }
  //bullets constructors

  void render()
  {
    fill(0, 0, 250);
    ellipse(x, y, 30, 30);
    move();
    //draws the alien
  }

  void move()
  {
    x = x + speedX;
  }
  //Allows the bullet to travel across the screen
}
