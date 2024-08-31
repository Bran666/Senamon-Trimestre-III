import 'dart:math';

class Senamon {
  String nombre;
  int nivel;
  String tipo;
  int peso;
  int salud;
  int ataque;
  int fase;
  int energia;
  String descripcion;
  bool disponible;

  Senamon(this.nombre, this.nivel, this.tipo, this.peso, this.salud, this.ataque, this.fase, this.energia, this.descripcion, this.disponible);

  void asignarAleatorios() {
    Random random = Random();
    this.peso = random.nextInt(91) + 10;
    this.salud = random.nextInt(31) + 30;
    this.ataque = random.nextInt(31) + 20;
    this.energia = random.nextInt(51) + 50;
  }
}


