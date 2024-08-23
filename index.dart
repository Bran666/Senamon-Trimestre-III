import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  Map<String, String> senamones = {
    "fuego": "",
    "agua": "",
    "hierva": "",
    "volador": "",
    "electrico": ""
  };
  
  // Random moneda = Random();
  // int resultado = moneda.nextInt(2);

  // if (resultado == 0) {
  //   print('Empieza el jugador 1');
  // } else {
  //   print('Empieza el jugador 2');
  // }

  print("Ingrese un tipo de senamon (Fuego, Agua, Hierva, Volador, Electrico):");
  String? tipo = stdin.readLineSync()!;

  if (senamones.containsKey(tipo)) {
    print("Ingrese el valor que desea asignar al tipo $tipo:");
    String? dragon = stdin.readLineSync();


    if (dragon != null) {
      senamones[tipo] = dragon;
      print("Senamon '$tipo' actualizado con el valor: $dragon");
    } else {
      print("No se ingresó un valor válido para el senamon.");
    }
  } else {
    print("Tipo de senamon no válido.");
  }

  print(senamones); 
}
