PImage img;
int geracoes = 1;
int atual = 0;
Geracao g;
int[][] matriz;
void setup() {
  size(500,428);
  img = loadImage("teste.bmp");
  matriz = new int[500][428];
  
  for(int i =0;i<img.pixels.length;i++){
    int x = i/500;
    int y = i%500;
    matriz[y][x] = img.pixels[i];
  }
  
  for(int i =0;i<matriz.length;i++){
    String s = "";
    for(int j =0;j<matriz[i].length;j++){
      s+=" "+matriz[i][j];
    }
    println(s);
  }
  
  g = new Geracao(100,500,428,matriz);
  
}

void draw(){
  if(atual < geracoes){
    image(img, 0, 0);
    g.combinar();
    //println(g.individuos);
    //g.desenhar();
    atual++;
  }
}