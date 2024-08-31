import 'CLASES/Entrenador.dart';
import 'CLASES/ManejarSenamones.dart';
import 'CLASES/batallas.dart';

void main() {
  ManejarSenamones manejador = ManejarSenamones();
  manejador.asignarAleatorios();

  Entrenador bran = Entrenador('Brandon', 'bran@gmail.com', DateTime(1990, 4, 1), 500, 10);
  Entrenador misty = Entrenador('Misty', 'misty@gmail.com', DateTime(1990, 5, 1), 400, 8);

  bran.agregarSenamonPorIndice(manejador, 0); 
  misty.agregarSenamonPorIndice(manejador, 1);

  Batalla batalla = Batalla(bran, misty, 0, 0);
  batalla.iniciarBatalla();
}
