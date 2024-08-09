# 📱 Pokedex - Tu enciclopedia Pokémon para iOS.

¡Bienvenido a **Pokedex**, tu guía definitiva sobre los Pokémon originales! Con esta aplicación podrás explorar una extensa base de datos (obtenida de https://pokeapi.co/) que contiene información detallada sobre tus Pokémon favoritos. 

## 🚀 Características Principales

- **Navegación Intuitiva**: Recorre la lista en la pantalla principal para ver una descripción resumida de cada Pokémon.
- **Búsqueda Rápida**: Utiliza la barra de búsqueda para encontrar rápidamente el Pokémon que deseas.
- **Detalle Exhaustivo**: Al hacer tap en cualquier Pokémon, serás llevado a una vista detallada donde podrás:
  - Ver los **tipos** a los que pertenece.
  - Explorar sus **estadísticas básicas** como puntos de vida (HP), ataque, defensa, velocidad, y más.
- **Experiencia 3D Interactiva**: ¡Gira la carta del Pokémon en 3D para verlo desde diferentes ángulos, tanto por delante como por detrás!
- **Varios lenguajes**: La aplicación soporta los lenguajes español, inglés e italiano. 🇲🇽 🇺🇸 🇮🇹 🍕
- **Modo claro y oscuro**: Puedes usar la aplicación en el modo que prefieras, para no lastimar tus ojos por la noche, o poder ver bien todos los detalles durante el día. 🌞 🌖
- **Optimizado para iPhone y iPad**: La aplicación es responsiva, por lo que funciona de maravilla en cualquier dispositivo iPhone o iPad.

## 🌟 Descubre y Aprende

Sumérgete en esta emocionante experiencia y expande tu conocimiento sobre los Pokémon. Con **Pokedex**, ¡aprender nunca fue tan divertido!

**Descárgala ahora** y comienza tu viaje Pokémon hoy mismo.


Para ejecutar la aplicación en tu dispositivo, sigue estos pasos:

1. **Clona el repositorio** en tu computadora.

2. **Abre el proyecto en Xcode.
   Navega hasta la carpeta del proyecto clonado.
   Haz doble clic en el archivo "Pokedex.xcodeproj"

3. **Selecciona tu dispositivo.
   Conecta tu iPhone o iPad a tu computadora.
   En Xcode, selecciona tu dispositivo en la barra de dispositivos de destino.
   *También puedes seleccionar un dispositivo virtual en la lista de simuladores.

4. **Compila y ejecuta.
   Haz clic en el botón reproducir "▶️" para compilar y ejecutar la aplicación en tu dispositivo.

Listo, ¡ahora puedes disfrutar de tu propio Pokedex en tus manos! 🤠
   
## 🗂️ Descripción de la arquitectura

El proyecto está elaborado siguiendo el patrón de arquitectura MVVM:

**Modelos: Los archivos “ResultsModel” y “PokemonModel” se utilizan para definir los atributos que serán recuperados en la llamada a la API “PokeAPI”, siguiendo las instrucciones que se indicaron en el documento.

**Vistas:
-La vista principal se llama “ListView”, y se encarga de mostrar una lista de los primeros 30 Pokemons disponibles en la API, ejecutando la función “fetchData()” del archivo “ListViewModel”, con lo cual se hace la primer llamada a la API. También este archivo hace una 2da llamada a la API a través de la vista auxiliar “ItemView”, que se encarga de cargar de manera asíncrona, las imágenes de los pokemons y su información detallada, para mostrar un resumen de estos datos en la lista.
-La vista “PokemonView” muestra el detalle de cada Pokemon e incluye una función de rotación en 3D de la carta que muestra la imagen del Pokemon. Aquí se utilizan dos vistas auxiliares: “RotationView” y “StatsView” para manejar el efecto de rotación de la carta y mostrar de manera atractiva las estadísticas del Pokemon, respectivamente.

**Modelo de Vistas:
Los archivos “ListViewModel” y “PokemonViewModel” se encargan de la lógica necesaria para hacer las llamadas a la API usando las funciones del framework Combine. Cada archivo hace una llamada distinta a la API dependiendo de las necesidades de las vistas respectivas en donde se utilizan dentro de la aplicación.
