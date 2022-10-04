class Defender
{
  final int x = 10;
  int y = 200;
  //needed variables for the defender class
  void render()
  {
    fill(0, 0, 200);
    rect(x, y, 20, 10); //draw top box
    fill(255, 0, 0); //draw rocket
    rect(x, y+10, 50, 20);
    triangle(x+50, y+10, x+50, y+30, x+60, y+20);
  }
  //draws the players character

  boolean Crash()
  {
    for (int i = AlienList.size()-1; i >= 0; i--)
    {
      Alien present = AlienList.get(i);
      //checks through each alien in the alien array list
      if (present.x <= 80)
      {
        return true;
        //if the alien hits the players wall, returns true so that the game can end
      }
    }
    return false;
  }
}
