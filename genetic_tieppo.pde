PImage img;
int epocas = 30;
int individuos = 10000;
int atual = 0;
Geracao g;
int[][] matriz;

String url;


void settings() {   
  
  //url = "teste.bmp";
    url = "teste-2.gif";
    //url = "teste-3.jpg";

   img = loadImage(url);
   size(img.width,img.height);
}
void setup() {
  
  matriz = new int[img.width][img.height];
  
  for(int i =0;i<img.pixels.length;i++){
    int x = i/img.width;
    int y = i%img.width;
    int c = img.pixels[i];
    if(c == -1){
      matriz[y][x] = 0;
    }else{
      matriz[y][x] = 1;
    }
  }
  g = new Geracao(individuos,500,428,matriz);
  
}

void draw(){
  if(atual < epocas){
    image(img, 0, 0);
    g.combinar();
    //g.desenhar();
    g.desenharTopo(10);
    //println(g.individuos);
    atual++;
    println(atual);
  }else{
    //g.desenhar();
    g.desenharTopo(1);
  }
}