import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'CLASES/asignarSenamon.dart';
import 'CLASES/datosUsuario.dart';

void main(List<String> args) {
  Map<String, String> senamones1 = {
    "fuego": "",
    "agua": "",
    "hierva": "",
    "volador": "",
    "electrico": ""
  };

  Map<String, String> senamones2 = {
    "fuego": "",
    "agua": "",
    "hierva": "",
    "volador": "",
    "electrico": ""
  };

  List<List<dynamic>> jugador = [];

  while (true) {
    print("""
1.Aumentar Ataque
2.Aumentar Salud
3.Iniciar Batalla""");
    int opcion = int.parse(stdin.readLineSync()!);
    switch (opcion) {
      case 1:
        print("Ingrese el numero del jugador 1/2");
        int jugador = int.parse(stdin.readLineSync()!);

        if (jugador == 1) {
          senamones1.forEach((key, value) {
            print(value);
          });

          print("Seleccion el nombre del senamon");
          String? bicho = stdin.readLineSync()!;
          senamones1.forEach((key, value) {
            if (bicho == value) {
            value.aumentarAtaque();
          }
          },)

        }
        break;
      default:
    }
    break;
  }

  for (var i = 0; i < 2; i++) {
    List<dynamic> filas = [];
    for (var j = 0; j < 1; j++) {
      print("Ingrese el nombre del jugador ${i + 1}:");
      String? nombre = stdin.readLineSync()!;
      filas.add(nombre);

      print("Ingrese el email del jugadro ${i + 1}");
      String? email = stdin.readLineSync()!;
      filas.add(email);

      print("Ingrese la fecha de nacimiento del jugador ${i + 1}");
      DateTime fechaNacimiento = DateTime.parse(stdin.readLineSync()!);
      filas.add(fechaNacimiento);

      int xp = 0;
      filas.add(xp);

      int batallasGanadas = 0;
      filas.add(batallasGanadas);
    }
    jugador.add(filas);
  }

  print(jugador);

//   // Random moneda = Random();
//   // int resultado = moneda.nextInt(2);

//   // if (resultado == 0) {
//   //   print('Empieza el jugador 1');
//   // } else {
//   //   print('Empieza el jugador 2');
//   // }

  senamones1.forEach((key, value) {
    print("Ingrese el nombre del senamon de $key");
    String? senamon = stdin.readLineSync()!.toLowerCase();
    senamones1[key] = senamon;
    print(senamones1);
  });

  senamones2.forEach((key, value) {
    print("Ingrese el nombre del senamon de $key");
    String? senamon = stdin.readLineSync()!.toLowerCase();
    senamones2[key] = senamon;
    print(senamones2);
  });

  senamones1.forEach((key, value) {
    print("Ingrese el peso del senamon $value");
    int peso = int.parse(stdin.readLineSync()!);

    print("Ingrese la descripcion del senamon $value");
    String? descripcion = stdin.readLineSync()!;

    print("Ingrese la energia del senamon $value");
    int energia = int.parse(stdin.readLineSync()!);

    senamon(value, 1, key, peso, 20, 100, energia, descripcion);
    print(senamones1);
  });

  senamones2.forEach((key, value) {
    print("Ingrese el peso del senamon $value");
    int peso = int.parse(stdin.readLineSync()!);

    print("Ingrese la descripcion del senamon $value");
    String? descripcion = stdin.readLineSync()!;

    print("Ingrese la energia del senamon $value");
    int energia = int.parse(stdin.readLineSync()!);

    senamon(value, 2, key, peso, 20, 100, energia, descripcion);
    print(senamones2);
  });
}
