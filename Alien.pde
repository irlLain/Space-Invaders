class Alien
{
  int x;
  int y;
  int YSpeed = 2;
  color colour;
  color colour2;
  //variables needed for the aliens

  Alien(int x, int y, color col, color col2)
  {
    this.x = x;
    this.y = y;
    this.colour = col;
    this.colour = col2;
  }
  //aliens constructors


  void render()
  {
    fill(Alien1Color);
    ellipse(x, y, 30, 30);
    fill(Alien2Color);
    ellipse(x, y, 50, 15);
    move();
    //draws the alien
  }

  void move()
  {
    y = y + YSpeed;
    if (y >= height)
    {
      YSpeed = -2;
      x = x - 50;
    }
    if (y <= 0)
    {
      YSpeed = 2;
      x = x - 50;
    }
    //prevents alien from vanishing off screen, once it has hit an edge it
    //changes direction and moves closer to the defender
  }
}
