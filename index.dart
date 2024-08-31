import 'CLASES/Entrenador.dart';
import 'CLASES/ManejarSenamones.dart';
import 'CLASES/batallas.dart';

void main() {
  ManejarSenamones manejador = ManejarSenamones();
  manejador.asignarAleatorios();

  Entrenador ash = Entrenador('Ash Ketchum', 'ash@example.com', DateTime(1990, 4, 1), 500, 10);
  Entrenador misty = Entrenador('Misty', 'misty@example.com', DateTime(1990, 5, 1), 400, 8);

  ash.agregarSenamonPorIndice(manejador, 0); 
  misty.agregarSenamonPorIndice(manejador, 1);

  // Iniciar una batalla
  Batalla batalla = Batalla(ash, misty, 0, 0);
  batalla.iniciarBatalla();
}
