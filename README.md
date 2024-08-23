# README: Proyecto Senamon - "Atrapa tu Senamon" - ADSO

## Descripción del Proyecto

El proyecto "Atrapa tu Senamon" es un videojuego desarrollado en Dart utilizando el paradigma de Programación Orientada a Objetos (POO). Este juego está inspirado en la captura y batalla de criaturas llamadas "Senamones", con características únicas que los jugadores pueden mejorar y utilizar en combates estratégicos. El objetivo del juego es capturar, entrenar y luchar con tus Senamones contra otros entrenadores para convertirte en el mejor.

## Fase I: Desarrollo Inicial

### Requerimientos del Juego

1. **Entrenadores y Senamones**:

   - Hay dos entrenadores (jugadores), cada uno con un equipo de 5 Senamones de diferentes tipos.
   - Los Senamones de cada entrenador pueden ser reemplazados por otros del "Mundo Senamón" en cualquier momento.
2. **Información del Entrenador**:

   - Cada entrenador tiene un perfil que incluye: nombre, email, fecha de nacimiento, nivel de experiencia y número de batallas ganadas.
3. **Entrenamiento de Senamones**:

   - Los entrenadores pueden aumentar la capacidad de ataque o defensa de sus Senamones antes o después de las batallas.
   - El entrenamiento consume puntos de experiencia del entrenador, y la cantidad de aumento depende de los puntos de experiencia disponibles.
4. **Características de los Senamones**:

   - Cada Senamon tiene atributos específicos: nombre, nivel, tipo (fuego, agua, hierva, volador, eléctrico), peso, puntos de salud, nivel de ataque, fase, nivel de energía y una breve descripción.
5. **Sistema de Batallas**:

   - Los entrenadores pueden enfrentarse en múltiples batallas.
   - Cada batalla consiste en turnos donde los Senamones atacan hasta que uno de ellos se quede sin puntos de salud.
   - El entrenador que derrote a 3 Senamones del oponente gana la batalla y gana puntos de experiencia adicionales.
6. **Determinación del Jugador Inicial**:

   - Antes de cada batalla, se lanza una moneda para decidir qué jugador comenzará el juego.
7. **Menú de Juego**:

   - El juego cuenta con un menú interactivo que permite realizar todas las acciones necesarias: capturar Senamones, entrenar, iniciar batallas, etc.

### Ejecución de las Batallas

- Los jugadores seleccionan un Senamon de su lista y se enfrentan por turnos.
- Cada ataque de un Senamon reduce los puntos de salud del oponente basado en la fórmula:
  ```
  puntos_vida_Senamon_defensor = puntos_vida_Senamon_defensor - ataque_contrincante
  ```
- El juego valida que el Senamon tenga puntos de salud superiores a cero antes de seleccionarlo para la batalla.

## Fase II: Expansión del Juego

### Nuevas Funcionalidades

1. **Tabla de Batalla Senamon**:

   - Las batallas tienen en cuenta la "Tabla de Batalla Senamon" que define la efectividad de los ataques según el tipo de Senamon.
2. **Tipos de Ataques y Efectividad**:

   - **Super Efectivo**: Quita el doble del valor del nivel de ataque del Senamon atacante.
   - **Efectivo**: Quita un 40% más del valor del nivel de ataque del Senamon atacante.
   - **Poco Efectivo**: Quita un 10% más del valor del nivel de ataque del Senamon atacante.
   - **Normal**: Quita la cantidad exacta del ataque del Senamon atacante.
3. **Torneo de Entrenadores**:

   - La aplicación permite la participación de más entrenadores, creando un entorno de torneo.

## Requisitos Técnicos

- **Lenguaje**: Dart
- **Paradigma**: Programación Orientada a Objetos (POO)
- **Plataforma**: Compatible con cualquier sistema que soporte Dart SDK

## Instalación y Configuración

1. **Clonar el Repositorio**:

   ```bash
   git clone https://github.com/tuusuario/atrapa-tu-senamon.git
   cd atrapa-tu-senamon
   ```
2. **Ejecutar el Juego**:

   ```bash
   dart run lib/main.dart
   ```

- [Video de referencia para lógica de programación](https://www.youtube.com/watch?v=SDv2vOIFIj8)

¡Diviértete jugando y que gane el mejor entrenador Senamon!
