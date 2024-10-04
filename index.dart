import 'dart:io';
import 'CLASES/Entrenador.dart';
import 'CLASES/ManejarSenamones.dart';
import 'CLASES/batallas.dart';

void main() {
  ManejarSenamones manejador = ManejarSenamones();
  manejador.asignarAleatorios();
  bool menu = true;

  Entrenador? entrenador1;
  Entrenador? entrenador2;
  int exp = 500;
  int batallasDefecto = 0;

  while (menu == true) {
    print("""
1. Ingresar entrenador.
2. Asignar Senamones.
3. Mostrar senamones de los entrenadores.
4. Iniciar batalla.
5. Mejorar Senamon.
6. Reemplazar Senamon.
7. Salir del juego.
""");

    int opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        print("Ingrese el nombre del entrenador 1:");
        String nombreEntrenador = stdin.readLineSync()!;
        print("Ingrese el correo del entrenador 1:");
        String correoEntrenador = stdin.readLineSync()!;
        print("Ingrese la fecha de nacimiento del entrenador 1 (AAAA-MM-DD):");
        DateTime fechaNacimiento = DateTime.parse(stdin.readLineSync()!);

        entrenador1 = Entrenador(nombreEntrenador, correoEntrenador,
            fechaNacimiento, exp, batallasDefecto);

        print("Ingrese el nombre del entrenador 2:");
        String nombreEntrenador2 = stdin.readLineSync()!;
        print("Ingrese el correo del entrenador 2:");
        String correoEntrenador2 = stdin.readLineSync()!;
        print("Ingrese la fecha de nacimiento del entrenador 2 (AAAA-MM-DD):");
        DateTime fechaNacimiento2 = DateTime.parse(stdin.readLineSync()!);

        entrenador2 = Entrenador(nombreEntrenador2, correoEntrenador2,
            fechaNacimiento2, exp, batallasDefecto);

        break;

      case 2:
        print("Asignar Senamones al entrenador 1:");
        manejador.mostrarSenamones();
        for (int i = 0; i < 5; i++) {
          bool senamonAsignado = false;
          while (!senamonAsignado) {
            print(
                "Ingrese el índice del Senamon para agregar al entrenador 1:");
            int indiceSenamon = int.parse(stdin.readLineSync()!);

            // Verificar si el Senamon está disponible
            if (manejador.senamones[indiceSenamon][9] == true) {
              entrenador1?.agregarSenamonPorIndice(manejador, indiceSenamon);
              senamonAsignado = true;
            } else {
              print("El Senamon seleccionado no está disponible. Elija otro.");
            }
          }
        }

        print("Asignar Senamones al entrenador 2:");
        manejador.mostrarSenamones();
        for (int i = 0; i < 5; i++) {
          bool senamonAsignado = false;
          while (!senamonAsignado) {
            print(
                "Ingrese el índice del Senamon para agregar al entrenador 2:");
            int indiceSenamon = int.parse(stdin.readLineSync()!);

            if (manejador.senamones[indiceSenamon][9] == true) {
              entrenador2?.agregarSenamonPorIndice(manejador, indiceSenamon);
              senamonAsignado = true;
            } else {
              print("El Senamon seleccionado no está disponible. Elija otro.");
            }
          }
        }
        break;

      case 3:
        if (entrenador1 == null) {
          print("No se ha asignado equipo al entrenador 1.");
        } else {
          print("Equipo del entrenador 1:");
          entrenador1.mostrarEquipo();
        }
        if (entrenador2 == null) {
          print("No se ha asignado equipo al entrenador 2.");
        } else {
          print("Equipo del entrenador 2:");
          entrenador2.mostrarEquipo();
        }

        break;

      case 4:
        if (entrenador1 != null && entrenador2 != null) {
          print(
              "Seleccione el índice del Senamon del entrenador 1 para la batalla:");
          entrenador1.mostrarEquipo();
          int indiceSenamon1 = int.parse(stdin.readLineSync()!);

          print(
              "Seleccione el índice del Senamon del entrenador 2 para la batalla:");
          entrenador2.mostrarEquipo();
          int indiceSenamon2 = int.parse(stdin.readLineSync()!);

          Batalla batalla = Batalla(entrenador1, entrenador2, indiceSenamon1,
              indiceSenamon2);
          batalla.iniciarBatalla();
        } else {
          print(
              "Ambos entrenadores deben estar registrados para iniciar una batalla.");
        }
        break;

      case 5:
        print("¿Qué entrenador desea mejorar a sus Senamones?");
        print("1. Entrenador 1");
        print("2. Entrenador 2");
        int opcionEntrenador = int.parse(stdin.readLineSync()!);

        if (opcionEntrenador == 1 && entrenador1 != null) {
          manejador.mejorarSenamon(entrenador1);
        } else if (opcionEntrenador == 2 && entrenador2 != null) {
          manejador.mejorarSenamon(entrenador2);
        } else {
          print("Opción inválida o entrenador no registrado.");
        }
        break;

      case 6:
        print("¿Qué entrenador desea reemplazar un Senamon?");
        print("1. Entrenador 1");
        print("2. Entrenador 2");
        int opcionEntrenadorReemplazo = int.parse(stdin.readLineSync()!);

        if (opcionEntrenadorReemplazo == 1 && entrenador1 != null) {
          entrenador1.reemplazarSenamon(entrenador1, manejador);
        } else if (opcionEntrenadorReemplazo == 2 && entrenador2 != null) {
          entrenador2.reemplazarSenamon(entrenador2, manejador);
        } else {
          print("Opción inválida o entrenador no registrado.");
        }
        break;

      case 7:
        print("Gracias por jugar. ¡Hasta la próxima!");
        menu = false;
        break;

      default:
        print("Opción no válida.");
        break;
    }
  }
}
