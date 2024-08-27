import 'dart:io';
import 'CLASES/asignarSenamon.dart';

void main(List<String> args) {
  Map<String, Senamon> senamones1 = {};
  Map<String, Senamon> senamones2 = {};

  Senamon crearSenamon(String tipoSenamon) {
    print("Ingrese el nombre del Senamon de tipo $tipoSenamon:");
    String nombre = stdin.readLineSync()!;

    print("Ingrese el peso del Senamon:");
    int peso = int.parse(stdin.readLineSync()!);

    print("Ingrese el ataque del Senamon:");
    int ataque = int.parse(stdin.readLineSync()!);

    print("Ingrese la energía del Senamon:");
    int energia = int.parse(stdin.readLineSync()!);

    print("Ingrese una descripción del Senamon:");
    String descripcion = stdin.readLineSync()!;

    return Senamon(nombre, 0, tipoSenamon, peso, ataque, 100, energia, descripcion);
  }

  List<String> tipos = ["fuego", "agua", "hierva", "volador", "electrico"];

  for (String tipo in tipos) {
    print("Jugador 1, ingrese los datos para el Senamon de tipo $tipo:");
    senamones1[tipo] = crearSenamon(tipo);
  }

  for (String tipo in tipos) {
    print("Jugador 2, ingrese los datos para el Senamon de tipo $tipo:");
    senamones2[tipo] = crearSenamon(tipo);
  }

  print("\nSenamones del Jugador 1:");
  senamones1.forEach((key, value) {
    print(value);
  });

  print("\nSenamones del Jugador 2:");
  senamones2.forEach((key, value) {
    print(value);
  });

  while (true) {
    print("""
1. Aumentar Ataque
2. Aumentar Salud
3. Iniciar Batalla
4. Salir
""");
    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        print("Ingrese el número del jugador (1 o 2):");
        int jugador = int.parse(stdin.readLineSync()!);

        if (jugador == 1) {
          senamones1.forEach((key, value) {
            print(value.nombre);
          });

          print("Seleccione el nombre del Senamon:");
          String? bicho = stdin.readLineSync()!;

          print("Ingrese cuanto ataque le desea aumentar a $bicho");
          int aumentAtaque = int.parse(stdin.readLineSync()!);


          senamones1.forEach((key, value) {
            if (bicho == value.nombre) {
              value.aumentarAtaque(aumentAtaque); 
            }
          });
        } else if (jugador == 2) {
          senamones2.forEach((key, value) {
            print(value.nombre);
          });

          print("Seleccione el nombre del Senamon:");
          String? bicho = stdin.readLineSync()!;

          senamones2.forEach((key, value) {
            if (bicho == value.nombre) {
              value.aumentarAtaque(10);
            }
          });
        }
        break;
    }
  }
}
