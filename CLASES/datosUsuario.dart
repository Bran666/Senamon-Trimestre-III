import 'dart:io';

class jugador {
  String nombre;
  String email;
  DateTime fechaNacimiento;
  int exp;
  int batallasGandas;

  jugador(this.nombre, this.email, this.fechaNacimiento, this.exp,
      this.batallasGandas);

  void ingresarDatos() {
    print('Ingrese el nombre del entrenador: ');
    nombre = stdin.readLineSync()!;

    print('Ingrese su email:');
    email = stdin.readLineSync()!;

    print('ingrese su fecha de Nacimiento:');
    fechaNacimiento = DateTime.parse(stdin.readLineSync()!);

    exp = 200;

    batallasGandas = 0;
  }
}
