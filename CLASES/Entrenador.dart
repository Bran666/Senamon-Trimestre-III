import 'Senamones.dart';
import 'ManejarSenamones.dart';
import 'dart:io';
class Entrenador {
  String nombre;
  String email;
  DateTime fechaNacimiento;
  int nivelExperiencia;
  int batallasGanadas;
  List<Senamon> senamones; 

  Entrenador(this.nombre, this.email, this.fechaNacimiento, this.nivelExperiencia, this.batallasGanadas)
    : senamones = [];

  void agregarSenamon(Senamon senamon) {
    if (senamones.length < 5) {
      senamones.add(senamon);
    } else {
      print('Ya tienes 5 Senamones. Reemplaza uno antes de agregar otro.');
    }
  }

  void agregarSenamonPorIndice(ManejarSenamones manejador, int indice) {
    if (indice >= 0 && indice < manejador.senamones.length) {
      List<dynamic> datosSenamon = manejador.senamones[indice];
      if (datosSenamon[9] == true) {
        datosSenamon[9] = false;
        Senamon nuevoSenamon = Senamon(
          datosSenamon[0],
          datosSenamon[1],
          datosSenamon[2],
          datosSenamon[3],
          datosSenamon[4],
          datosSenamon[5],
          datosSenamon[6],
          datosSenamon[7],
          datosSenamon[8],
          datosSenamon[9],
        );
        agregarSenamon(nuevoSenamon);
        print('Has agregado a ${nuevoSenamon.nombre} a tu equipo.');
      } else {
        print('El Senamon seleccionado no está disponible.');
      }
    } else {
      print('Índice de Senamon inválido.');
    }
  }

  void mostrarEquipo() {
    print('Senamones en el equipo:');
    for (int i = 0; i < senamones.length; i++) {
      Senamon senamon = senamones[i];
      print('$i. ${senamon.nombre} - Tipo: ${senamon.tipo}, Salud: ${senamon.salud}, Ataque: ${senamon.ataque}');
    }
  }

void reemplazarSenamon(Entrenador entrenador, ManejarSenamones manejador) {
  print("Seleccione el Senamon del ${entrenador.nombre} que desea reemplazar:");
  entrenador.mostrarEquipo();
  int indiceReemplazar = int.parse(stdin.readLineSync()!);

  if (indiceReemplazar >= 0 && indiceReemplazar < entrenador.senamones.length) {
    print("Senamones disponibles en el Mundo Senamon:");
    manejador.mostrarSenamones();
    print("Seleccione el índice del Senamon para reemplazar:");
    int indiceNuevoSenamon = int.parse(stdin.readLineSync()!);

    if (indiceNuevoSenamon >= 0 && indiceNuevoSenamon < manejador.senamones.length) {
      List<dynamic> datosSenamon = manejador.senamones[indiceNuevoSenamon];
      if (datosSenamon[9] == true) {
        datosSenamon[9] = false;
        Senamon nuevoSenamon = Senamon(
          datosSenamon[0],
          datosSenamon[1],
          datosSenamon[2],
          datosSenamon[3],
          datosSenamon[4],
          datosSenamon[5],
          datosSenamon[6],
          datosSenamon[7],
          datosSenamon[8],
          datosSenamon[9],
        );

        entrenador.senamones[indiceReemplazar] = nuevoSenamon;
        print("Has reemplazado a tu Senamon por ${nuevoSenamon.nombre}.");
      } else {
        print("El Senamon seleccionado no está disponible.");
      }
    } else {
      print("Índice de Senamon inválido.");
    }
  } else {
    print("Índice de Senamon inválido.");
  }
}
}
