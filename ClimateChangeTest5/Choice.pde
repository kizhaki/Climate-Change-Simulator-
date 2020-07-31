class Choice {

  int x; 
  int y; 
  int h;
  int w;

  boolean isselected;
  
  String text; 
  int PPM; 
  int waterlevel; 
  int cost;
  
  
  public Choice(int newx, int newy, int newh, int neww) {
    x = newx;
    y = newy;
    h = newh;
    w = neww;
    isselected = false;

  }

  void drawChoice(){
      if(isselected) {
         fill(0, 255, 0);
         rect(x-4, y-4, w+8, h+8);
      }
       fill(255, 255, 255);
       rect(x, y, w, h); 
       textSize(18);
       fill(0, 0, 0);
       text(text, x+5, y+25); 
       text("PPM:" + PPM , x+5, y + 50);
       text("Cost:" + cost, x+5, y + 75);
  }
  //if (mousex>x && mousex<x+w && mousey>y && mousey<y+h){
  //  return true;  
  //}
  
  void setvalues(int newPPM, int newcost, String newtext){
    PPM = newPPM;
    cost = newcost;
    text = newtext;
  }
  
  boolean contains(int mouseX, int mouseY){
    if(x < mouseX && mouseX < x+w && y < mouseY && mouseY < y+h){
     return true;
    } else {
     return false;  
    }
  }
  
 int getPPM(){
   return PPM; 
  }
  
 int getcost(){
  return cost;  
 }
  
  
 public void selected(boolean isit) {
   isselected = isit;
 }
}


  
  
  
  
  
