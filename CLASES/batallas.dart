import 'Senamones.dart';
import 'Entrenador.dart';

class Batalla {
  Entrenador entrenador1;
  Entrenador entrenador2;
  int indiceSenamon1;
  int indiceSenamon2;

  Batalla(this.entrenador1, this.entrenador2, this.indiceSenamon1, this.indiceSenamon2);

  void iniciarBatalla() {
    if (indiceSenamon1 >= 0 && indiceSenamon1 < entrenador1.senamones.length &&
        indiceSenamon2 >= 0 && indiceSenamon2 < entrenador2.senamones.length) {

      List<Senamon> senamones1 = entrenador1.senamones;
      List<Senamon> senamones2 = entrenador2.senamones;

      int derrotas1 = 0;
      int derrotas2 = 0;

      while (derrotas1 < 3 && derrotas2 < 3) {
        Senamon senamon1 = senamones1[indiceSenamon1];
        Senamon senamon2 = senamones2[indiceSenamon2];

        print('Batalla entre ${entrenador1.nombre} con ${senamon1.nombre} y ${entrenador2.nombre} con ${senamon2.nombre}!');
        
        while (senamon1.salud > 0 && senamon2.salud > 0) {
          int danio1 = senamon1.ataque;
          senamon2.salud -= danio1;
          print('${senamon1.nombre} ataca a ${senamon2.nombre} causando $danio1 de daño. Salud restante de ${senamon2.nombre}: ${senamon2.salud}');
          
          if (senamon2.salud <= 0) {
            print('${senamon2.nombre} ha sido derrotado!');
            derrotas2++;
            break;
          }

          int danio2 = senamon2.ataque;
          senamon1.salud -= danio2;
          print('${senamon2.nombre} ataca a ${senamon1.nombre} causando $danio2 de daño. Salud restante de ${senamon1.nombre}: ${senamon1.salud}');

          if (senamon1.salud <= 0) {
            print('${senamon1.nombre} ha sido derrotado!');
            derrotas1++;
            break;
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
}
