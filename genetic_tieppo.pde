PImage img;
int geracoes = 100;
int atual = 0;
Geracao g;
int[][] matriz;
void setup() {
  size(500,428);
  img = loadImage("teste.bmp");
  matriz = new int[500][428];
  
  
  g = new Geracao(100,500,428,matriz);
  
}

void draw(){
  if(atual < geracoes){
    image(img, 0, 0);
    g.combinar();
    println(g.individuos);
    g.desenhar();
    atual++;
  }
}