int[] listaDisplay;

void setup() {
  size(640, 360);
  stroke(60, 125, 200);
  strokeWeight(3);
  listaDisplay = new int[width];
}
void draw() {
  background(80, 50, 100);
  desenhar(listaDisplay);
  //criarLista_ordemCrescente(listaDisplay);
  criarLista_ordemDecrescente(listaDisplay);
  //criarLista_Aleatoria(listaDisplay);
  embaralhar(listaDisplay);
  ordenar(listaDisplay);
  //saveFrame("frames/bubble####.png");  //Esse comando serve para salvar cada frame numa iamgem .png,
  //possibilitando a criação de um vídeo ou GIF através da ferramenta "Movie Maker" do Processing.
}
