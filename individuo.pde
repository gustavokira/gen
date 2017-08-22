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
    calcularFitness();
  }
  public void calcularFitness(){
    this.fitness = random(1);
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