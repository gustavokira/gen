class Individuo{
  int x,y;
  float fitness;
  float r;
  int[][] matriz;
  public Individuo(int x, int y, float r,int[][] m){
    this.x = x;
    this.y = y;
    this.r = r;
    this.matriz = m;
    
    if(this.x < 0)this.x = 0;
    if(this.y < 0)this.y = 0;
    if(this.r < 5)this.r = 5;
    
    if(this.x > m.length)this.x = m.length;
    if(this.y > m[0].length)this.y = m[0].length;
 
    
    calcularFitness();
  }
  
  public float distToCentro(int x,int y){
    return sqrt( pow(y-this.y,2) + pow(x-this.x,2)  );
  }
  
 
  public void calcularFitness(){
    
    float fitness = 0;
    float raioImg = 0;
    //int c = this.matriz[x][y];
    
    int xi = this.x-int(this.r);
    int yi = this.y-int(this.r);
    int xf = int(xi+2*this.r);
    int yf = int(yi+2*this.r);
    int total = (xf-xi)*(yf-yi);
    
    // se o raio esta fora da imagem
    if(total == 0 || xi < 0 || yi < 0 || xf > this.matriz.length || yf > this.matriz[0].length ){
     fitness = 0;
    }else{
      int dentroDoRaio = 0;
      int dentroDoRaioEscuro = 0;
      int dentroDoRaioClaro = 0;
      int foraDoRaio = 0;
      int foraDoRaioEscuro = 0;
      int foraDoRaioClaro = 0;
      for(int i = xi;i<xf;i++){
        for(int j = yi;j<yf;j++){
            if(distToCentro(i,j)<=this.r){
              dentroDoRaio++;
              if(this.matriz[i][j] == 1){
                dentroDoRaioEscuro++;
              }else{
                dentroDoRaioClaro++;
              }
            }else{
              foraDoRaio++;
              if(this.matriz[i][j] == 1){
                foraDoRaioEscuro++;
              }else{
                foraDoRaioClaro++;
              }
            }
          }
        }
      
      
      float dentroEscuro = dentroDoRaioEscuro/dentroDoRaio;
      float foraClaro = foraDoRaioClaro/foraDoRaio;
      
      //rel raio com diagonal
      raioImg = this.r/sqrt(pow(this.matriz.length,2)+pow(this.matriz[0].length,2));
      
      fitness = (raioImg+dentroEscuro+foraClaro)/3;
    }
    this.fitness = fitness;
  }
  public Individuo misturar(Individuo outro){
    int fx = this.x;
    int fy = this.y;
    float fr = this.r;
    float rx = random(1);
    float ry = random(1);
    float rr = random(1);
    
    if(rx > 0.5){
      fx = outro.x;
    }
    if(ry > 0.5){
      fy = outro.y;
    }
    if(rr > 0.5){
      fr = outro.r;
    }
    int offset = 50;
    int roleta = 100;
    
    roleta = int(random(100));
    if(roleta < 10){
      offset = int(random(this.matriz.length));
    }
    rx = random(-offset,offset);
    
    roleta = int(random(100));
    if(roleta < 10){
      offset = int(random(this.matriz.length));
    }
    ry = random(-offset,offset);
    
    roleta = int(random(100));
    if(roleta < 10){
      offset = int(random(this.matriz.length));
    }
    rr = random(-offset,offset);
    fx+=rx;
    fy+=ry;
    fr+=rr;
    return new Individuo(fx,fy,fr,this.matriz);
  }
  
  public void desenhar(int r,int g,int b,int a){
    fill(r,g,b);
    point(this.x,this.y);
    noFill();
    stroke(r,g,b,a);
    ellipse(this.x,this.y,this.r,this.r);
  }
  @Override
  public String toString(){
    return this.fitness+"";
  }
}