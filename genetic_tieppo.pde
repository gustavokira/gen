PImage img;
int epocas = 100;
int individuos = 50;
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
    int c = img.pixels[i];
    if(c == -1){
      matriz[y][x] = 0;
    }else{
      matriz[y][x] = 1;
    }
  }
  g = new Geracao(individuos,500,428,matriz);
  
  //for(int i =0;i<matriz.length;i++){
  //  String s = "";
  //  for(int j =0;j<matriz[i].length;j++){
  //    s+=matriz[i][j];
  //  }
  //  println(s);
  //}
}

void draw(){
  if(atual < epocas){
    image(img, 0, 0);
    g.combinar();
    //println(g.individuos);
    g.desenhar();
    atual++;
  }
}