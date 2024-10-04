import 'dart:math';
import 'Entrenador.dart';
import 'Senamones.dart';
import 'dart:io';

class ManejarSenamones {
  List<List<dynamic>> senamones = [
    // NOMBRE   NIVEL  TIPO  PESO SALUD  ATAQUE FASE ENERGIA            DESCRIPCION        DISPONIBLE
    ['Charmander', 1, 'Fuego', 0, 0, 0, 1, 0, 'Este es un Pokémon de fuego llamado Charmander.', true],
    ['Squirtle', 1, 'Agua', 0, 0, 0, 1, 0, 'Este es un Pokémon de agua llamado Squirtle.', true],
    ['Bulbasaur', 1, 'Hierba', 0, 0, 0, 1, 0, 'Este es un Pokémon de hierba llamado Bulbasaur.', true],
    ['Pikachu', 1, 'Electrico', 0, 0, 0, 1, 0, 'Este es un Pokémon Electrico llamado Pikachu.', true],
    ['Pidgey', 1, 'Volador', 0, 0, 0, 1, 0, 'Este es un Pokémon volador llamado Pidgey.', true],
    ['Growlithe', 1, 'Fuego', 0, 0, 0, 1, 0, 'Este es un Pokémon de fuego llamado Growlithe.', true],
    ['Magikarp', 1, 'Agua', 0, 0, 0, 1, 0, 'Este es un Pokémon de agua llamado Magikarp.', true],
    ['Bellsprout', 1, 'Hierba', 0, 0, 0, 1, 0, 'Este es un Pokémon de hierba llamado Bellsprout.', true],
    ['Magnemite', 1, 'Electrico', 0, 0, 0, 1, 0, 'Este es un Pokémon Electrico llamado Magnemite.', true],
    ['Spearow', 1, 'Volador', 0, 0, 0, 1, 0, 'Este es un Pokémon volador llamado Spearow.', true],
    ['Vulpix', 1, 'Fuego', 0, 0, 0, 1, 0, 'Este es un Pokémon de fuego llamado Vulpix.', true],
    ['Psyduck', 1, 'Agua', 0, 0, 0, 1, 0, 'Este es un Pokémon de agua llamado Psyduck.', true],
    ['Oddish', 1, 'Hierba', 0, 0, 0, 1, 0, 'Este es un Pokémon de hierba llamado Oddish.', true],
    ['Jolteon', 1, 'Electrico', 0, 0, 0, 1, 0, 'Este es un Pokémon Electrico llamado Jolteon.', true],
    ['Zubat', 1, 'Volador', 0, 0, 0, 1, 0, 'Este es un Pokémon volador llamado Zubat.', true],
  ];

  void asignarAleatorios() {
    for (var senamon in senamones) {
      senamon[3] = Random().nextInt(91) + 10;   // Peso
      senamon[4] = Random().nextInt(31) + 30;   // Salud
      senamon[5] = Random().nextInt(31) + 20;   // Ataque
      senamon[7] = Random().nextInt(51) + 50;   // Energía
    }
  }

  void mostrarSenamones() {
    int i = 0;
    for (var senamon in senamones) {

      print('''
      Indice : $i
      Nombre: ${senamon[0]}
      Nivel: ${senamon[1]}
      Tipo: ${senamon[2]}
      Peso: ${senamon[3]}
      Salud: ${senamon[4]}
      Ataque: ${senamon[5]}
      Fase: ${senamon[6]}
      Energía: ${senamon[7]}
      Descripción: ${senamon[8]}
      Disponible: ${senamon[9]}
      ''');
      print('-----------------------------');
      i++;
    }
  }


void returnFuego() {
  for (var senamon in senamones) {
    if (senamon[2] == "Fuego") {
      print(senamon[0]);
    }
  }
}

void returnAgua() {
  for (var senamon in senamones) {
    if (senamon[2] == "Agua") {
      print(senamon[0]);
    }
  }
}

void returnHierva() {
  for (var senamon in senamones) {
    if (senamon[2] == "Hierva") {
      print(senamon[0]);
    }
  }
}

void returnElectrico() {
  for (var senamon in senamones) {
    if (senamon[2] == "Electrico") {
      print(senamon[0]);
    }
  }
}

void returnVolador() {
  for (var senamon in senamones) {
    if (senamon[2] == "Volador") {
      print(senamon[0]);
    }
  }
}

void mejorarSenamon(Entrenador entrenador) {
  if (entrenador.nivelExperiencia > 200) {
    print("Seleccione el Senamon del ${entrenador.nombre} que desea mejorar:");
    entrenador.mostrarEquipo();
    int indiceSenamon = int.parse(stdin.readLineSync()!);

    if (indiceSenamon >= 0 && indiceSenamon < entrenador.senamones.length) {
      print("¿Desea mejorar 1. Ataque o 2. Salud?");
      int opcionMejora = int.parse(stdin.readLineSync()!);

      Senamon senamon = entrenador.senamones[indiceSenamon];
      if (opcionMejora == 1) {
        senamon.ataque += 10; 
        entrenador.nivelExperiencia -= 200;
        print("Ataque de ${senamon.nombre} mejorado a ${senamon.ataque}.");
      } else if (opcionMejora == 2) {
        senamon.salud += 20; 
        entrenador.nivelExperiencia -= 200; 
        print("Salud de ${senamon.nombre} mejorada a ${senamon.salud}.");
      } else {
        print("Opción inválida.");
      }
    } else {
      print("Índice de Senamon inválido.");
    }
  } else {
    print("${entrenador.nombre} no tiene suficiente experiencia.");
  }
}
}