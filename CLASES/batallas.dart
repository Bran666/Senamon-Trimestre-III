import 'dart:math';
import 'Senamones.dart';
import 'Entrenador.dart';

class Batalla {
  Entrenador entrenador1;
  Entrenador entrenador2;
  int indiceSenamon1;
  int indiceSenamon2;
  int entrenadorInicial;

  // Inicialización de 'entrenadorInicial' en la lista de inicializadores
  Batalla(this.entrenador1, this.entrenador2, this.indiceSenamon1, this.indiceSenamon2)
      : entrenadorInicial = Random().nextInt(2) {
    print(entrenadorInicial == 0 
        ? '${entrenador1.nombre} comienza la batalla.' 
        : '${entrenador2.nombre} comienza la batalla.');
  }

  void iniciarBatalla() {
    if (indiceSenamon1 >= 0 && indiceSenamon1 < entrenador1.senamones.length && indiceSenamon2 >= 0 && indiceSenamon2 < entrenador2.senamones.length) {
      List<Senamon> senamones1 = entrenador1.senamones;
      List<Senamon> senamones2 = entrenador2.senamones;

      int derrotas1 = 0;
      int derrotas2 = 0;

      List<int> saludOriginal1 = senamones1.map((s) => s.salud).toList();
      List<int> saludOriginal2 = senamones2.map((s) => s.salud).toList();

      while (derrotas1 < 3 && derrotas2 < 3) {
        Senamon senamon1 = senamones1[indiceSenamon1];
        Senamon senamon2 = senamones2[indiceSenamon2];

        print('Batalla entre ${entrenador1.nombre} con ${senamon1.nombre} y ${entrenador2.nombre} con ${senamon2.nombre}!');

        while (senamon1.salud > 0 && senamon2.salud > 0) {
          double multiplicador = calcularMultiplicador(senamon1.tipo, senamon2.tipo);
          if (entrenadorInicial == 0) {
            int danio1 = (senamon1.ataque * multiplicador).toInt();
            senamon2.salud = (senamon2.salud - danio1).clamp(0, senamon2.salud);
            print('${senamon1.nombre} ataca a ${senamon2.nombre} causando $danio1 de daño. Salud restante de ${senamon2.nombre}: ${senamon2.salud}');

            if (senamon2.salud <= 0) {
              print('${senamon2.nombre} ha sido derrotado!');
              derrotas2++;
              break;
            }

            multiplicador = calcularMultiplicador(senamon2.tipo, senamon1.tipo);
            int danio2 = (senamon2.ataque * multiplicador).toInt();
            senamon1.salud = (senamon1.salud - danio2).clamp(0, senamon1.salud);
            print('${senamon2.nombre} ataca a ${senamon1.nombre} causando $danio2 de daño. Salud restante de ${senamon1.nombre}: ${senamon1.salud}');

            if (senamon1.salud <= 0) {
              print('${senamon1.nombre} ha sido derrotado!');
              derrotas1++;
              break;
            }
          } else if (entrenadorInicial == 1) {
            int danio2 = (senamon2.ataque * multiplicador).toInt();
            senamon1.salud = (senamon1.salud - danio2).clamp(0, senamon1.salud);
            print('${senamon2.nombre} ataca a ${senamon1.nombre} causando $danio2 de daño. Salud restante de ${senamon1.nombre}: ${senamon1.salud}');

            if (senamon1.salud <= 0) {
              print('${senamon1.nombre} ha sido derrotado!');
              derrotas1++;
              break;
            }

            int danio1 = (senamon1.ataque * multiplicador).toInt();
            senamon2.salud = (senamon2.salud - danio1).clamp(0, senamon2.salud);
            print('${senamon1.nombre} ataca a ${senamon2.nombre} causando $danio1 de daño. Salud restante de ${senamon2.nombre}: ${senamon2.salud}');

            if (senamon2.salud <= 0) {
              print('${senamon2.nombre} ha sido derrotado!');
              derrotas2++;
              break;
            }
          }
        }

        if (derrotas1 < 3 && derrotas2 < 3) {
          indiceSenamon1 = obtenerIndiceSenamonSiguiente(senamones1);
          indiceSenamon2 = obtenerIndiceSenamonSiguiente(senamones2);
        }
      }

      if (derrotas1 >= 3) {
        print('${entrenador2.nombre} ha ganado la batalla!');
        entrenador2.batallasGanadas++;
      } else if (derrotas2 >= 3) {
        print('${entrenador1.nombre} ha ganado la batalla!');
        entrenador1.batallasGanadas++;
      }

      for (int i = 0; i < senamones1.length; i++) {
        senamones1[i].salud = saludOriginal1[i];
      }
      for (int i = 0; i < senamones2.length; i++) {
        senamones2[i].salud = saludOriginal2[i];
      }
    } else {
      print('Índices de Senamones inválidos para uno o ambos entrenadores.');
    }
  }

  int obtenerIndiceSenamonSiguiente(List<Senamon> senamones) {
    for (int i = 0; i < senamones.length; i++) {
      if (senamones[i].salud > 0) {
        return i;
      }
    }
    return -1;
  }

  double calcularMultiplicador(String tipoAtacante, String tipoAtacado) {
    // Fuego ataca a
    if (tipoAtacante == "Fuego" && tipoAtacado == "Fuego") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Fuego" && tipoAtacado == "Agua") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Fuego" && tipoAtacado == "Hierba") {
        return 1.4; // Efectivo
    } else if (tipoAtacante == "Fuego" && tipoAtacado == "Volador") {
        return 1.0; // Normal
    } else if (tipoAtacante == "Fuego" && tipoAtacado == "Electrico") {
        return 2.0; // Super efectivo
    }
    
    // Agua ataca a
    else if (tipoAtacante == "Agua" && tipoAtacado == "Fuego") {
        return 2.0; // Super efectivo
    } else if (tipoAtacante == "Agua" && tipoAtacado == "Agua") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Agua" && tipoAtacado == "Hierba") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Agua" && tipoAtacado == "Volador") {
        return 1.4; // Efectivo
    } else if (tipoAtacante == "Agua" && tipoAtacado == "Electrico") {
        return 1.0; // Normal
    }

    // Hierba ataca a
    else if (tipoAtacante == "Hierba" && tipoAtacado == "Fuego") {
        return 1.0; // Normal
    } else if (tipoAtacante == "Hierba" && tipoAtacado == "Agua") {
        return 2.0; // Super efectivo
    } else if (tipoAtacante == "Hierba" && tipoAtacado == "Hierba") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Hierba" && tipoAtacado == "Volador") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Hierba" && tipoAtacado == "Electrico") {
        return 1.4; // Efectivo
    }

    // Volador ataca a
    else if (tipoAtacante == "Volador" && tipoAtacado == "Fuego") {
        return 1.0; // Normal
    } else if (tipoAtacante == "Volador" && tipoAtacado == "Agua") {
        return 1.4; // Efectivo
    } else if (tipoAtacante == "Volador" && tipoAtacado == "Hierba") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Volador" && tipoAtacado == "Volador") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Volador" && tipoAtacado == "Electrico") {
        return 1.0; // Normal
    }

    // Electrico ataca a
    else if (tipoAtacante == "Electrico" && tipoAtacado == "Fuego") {
        return 1.0; // Normal
    } else if (tipoAtacante == "Electrico" && tipoAtacado == "Agua") {
        return 1.4; // Efectivo
    } else if (tipoAtacante == "Electrico" && tipoAtacado == "Hierba") {
        return 1.1; // Poco efectivo
    } else if (tipoAtacante == "Electrico" && tipoAtacado == "Volador") {
        return 2.0; // Super efectivo
    } else if (tipoAtacante == "Electrico" && tipoAtacado == "Electrico") {
        return 1.1; // Poco efectivo
    }

    return 1.0; 
  }
}
