class senamon {
  String nombre;
  int nivel;
  String tipoSenamon;
  int peso;
  int ataque;
  int salud;
  int energia;
  String descripcion;

  senamon(
    this.nombre,
    this.nivel,
    this.tipoSenamon,
    this.peso,
    this.ataque,
    this.salud,
    this.energia,
    this.descripcion,
  );

  void aumentarAtaque(int ataque) {
    this.ataque += ataque;
  }

  void aumentarSalud(int salud) {
    this.salud += salud;
  }
}
