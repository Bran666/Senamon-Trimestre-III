class Senamon {
  String nombre;
  int nivel;
  String tipoSenamon;
  int peso;
  int ataque;
  int salud;
  int energia;
  String descripcion;

  Senamon(
    this.nombre,
    this.nivel,
    this.tipoSenamon,
    this.peso,
    this.ataque,
    this.salud,
    this.energia,
    this.descripcion,
  );

  void aumentarAtaque(int aumento) {
    this.ataque += aumento;
    print("El ataque de $nombre ha aumentado a $ataque.");
  }

  void aumentarSalud(int aumento) {
    this.salud += aumento;
    print("La salud de $nombre ha aumentado a $salud.");
  }

  String toString() {
    return "Nombre: $nombre, Tipo: $tipoSenamon, Nivel: $nivel, Peso: $peso, Ataque: $ataque, Salud: $salud, Energía: $energia, Descripción: $descripcion";
  }
}