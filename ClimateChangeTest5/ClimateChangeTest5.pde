PImage deepocean;
PImage desert; 
PImage drygrass; 
PImage forest; 
PImage ocean; 
PImage grassland; 
PImage mountain; 
float waterlevel = 1; 
int money = 100; //$100 trillion per year (USD) 
int deltamoney = 0; 
int year = 2020; 
int deltaday = 0; 
int simspeed = 5; 
int day = 0; 
int PPM = 410; //Carbon Dioxide 2020
int PPMperyear = 0; 
String[] qlines = {"Question: How much money",
  "do you invest in green", 
  "technology?"}; 
int[][] map; 
Choice c1; 
Choice c2;
Choice c3;



void setup() {
  size(1000, 1100);
  // Load image from a web server
  deepocean = loadImage("deepocean1.gif"); //0
  desert = loadImage("desert1.gif"); //2
  drygrass = loadImage("drygrass1.gif"); //3
  forest = loadImage("forest1.gif"); //5
  ocean = loadImage("ocean1.gif"); //1
  grassland = loadImage("grassland1.gif"); //4
  mountain = loadImage("mountain1.gif"); //6

  c1 = new Choice(500, 925, 100, 100);
  c2 = new Choice(600, 925, 100, 100);
  c3 = new Choice(700, 925, 100, 100);
  
  
  c1.setvalues(3, 2, "Fossil");
  
  c2.setvalues(0, -2, "Solar");
  
  c3.setvalues(1, -1, "Hydrogen");
  

  
  
  int[][] loadmap = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5}, 
    {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5}, 
    {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6}, 
    {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6}, 
    {0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6}, 
    {0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6}, 
    {0, 0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6}, 
    {0, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6}, 
    {1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6}, 
    {1, 1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6}, 
    {1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6}, 
    {1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6}, 
    {1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6}, 
    {2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6}, 


  }; 
  map = loadmap;
}

void draw() {
  day += deltaday*simspeed; 
  if(day > 365){
   day = 0; 
   year += 1; 
   PPM += PPMperyear;
   waterlevel = (PPM-400)/10; 
   money += deltamoney;
  }
  
  background(0, 0, 0);
  for (int row = 0; row<map.length; row++) {
    for (int col = 0; col<map[row].length; col++) {
      if (map[row][col]==0) {
        image(deepocean, col*40, row*40);
      } else if (map[row][col]<=waterlevel) {
        image(ocean, col*40, row*40);
      } else if (map[row][col]==2) {
        image(desert, col*40, row*40);
      } else if (map[row][col]==3) {
        image(drygrass, col*40, row*40);
      } else if (map[row][col]==4) {
        image(grassland, col*40, row*40);
      } else if (map[row][col]==5) {
        image(forest, col*40, row*40);
      } else if (map[row][col]==6) {
        image(mountain, col*40, row*40);
      }
    }
    fill(255, 255, 255); 
    c1.drawChoice(); 
    c2.drawChoice();
    c3.drawChoice();
  }




  textSize(24); 
  fill(255, 255, 255); 
  text("Year:" + year, 50, 850); 
  text("Day:" + day, 50, 875); 
  text("PPM:" + PPM, 50, 900); 
  text("Water Level:" + waterlevel, 50, 925); 
  text("Money:" + money, 50, 950); 
  text(qlines[0], 500, 850); 
  text(qlines[1], 500, 875); 
  text(qlines[2], 500, 900);
}



void mouseClicked() {
  if (c1.contains(mouseX, mouseY)) {
    PPMperyear = c1.getPPM();
    deltaday = 1; 
    deltamoney = c1.getcost();
    
    c1.selected(true);
    c2.selected(false);
    c3.selected(false);
  }
  if (c2.contains(mouseX, mouseY)) {
    PPMperyear = c2.getPPM();
    deltaday = 1; 
    deltamoney = c2.getcost();

    c1.selected(false);
    c2.selected(true);
    c3.selected(false);
}  
  if (c3.contains(mouseX, mouseY)) {
    PPMperyear = c3.getPPM();
    deltaday = 1; 
    deltamoney = c3.getcost();

    c1.selected(false);
    c2.selected(false);
    c3.selected(true);
}  
  
}


// https://www.nrdc.org/sites/default/files/cost.pdf , cost of inaction ($1.9 trillion/year)
//Carbon dioxide PPM in 2020 (https://www.climate.gov/news-features/understanding-climate/climate-change-atmospheric-carbon-dioxide) 
//in trillions of dollars (https://www.greentechmedia.com/articles/read/renewable-us-grid-for-4-5-trillion 
//https://cgmf.org/blog-entry/246/The-U.S.-electric-grid-would-cost-5-trillion-to-replace.-Where-should-infrastructure-spending-go.html) 
