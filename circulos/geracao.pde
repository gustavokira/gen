import java.util.Collections;
import java.util.Comparator;

class Geracao{
  ArrayList<Individuo>individuos;
  int epoca;
  
  public Geracao(int qty,int w,int h,int[][] m){
    this.individuos = new ArrayList<Individuo>(); 
    this.epoca = 0;
    for(int i =0;i<qty;i++){
      Individuo ind = criarAleatorio(w,h,m);
      this.individuos.add(ind);
    }
    
  }
  public void desenhar(){
    for(int i =1;i<this.individuos.size();i++){
      this.individuos.get(i).desenhar(255,0,0,5);
    }
    this.individuos.get(0).desenhar(0,255,0,255);
  }
  
  public void desenharTopo(int qty){
    for(int i =1;i<qty-1;i++){
      this.individuos.get(i).desenhar(255,0,0,5);
    }
    this.individuos.get(0).desenhar(0,255,0,255);
  }
  
  public void combinar(){
    this.autoOrdenar();
    
    int qty = this.individuos.size();
    this.individuos.subList(floor(qty*1/3),qty).clear();
    ArrayList<Individuo> filhos = new ArrayList<Individuo>();
    for(int i = 0;i<ceil(qty*2/3);i++){
      int m = ceil(qty*1/3)-1;
      int idp = int(random(m));
      int idm = int(random(m));
      Individuo filho = this.individuos.get(idp).misturar(this.individuos.get(idm));
      filhos.add(filho);
    }
    this.individuos.addAll(filhos);
    
    
    
    this.epoca++; 
  }
    
  public Individuo criarAleatorio(int w,int h,int[][] m){
    int x = int(random(w));
    int y = int(random(h));
    int r = int(random(max(w,h)/2));
    return new Individuo(x,y,r,m);
  }
  
  public void autoOrdenar(){
    Collections.sort(this.individuos, new Comparator<Individuo>() {
      public int compare(Individuo i1,Individuo i2) 
      {
        if(i1.fitness < i2.fitness) return 1;
        else if(i1.fitness == i2.fitness) return 0;
        else return -1;
      }
    });
  }
}