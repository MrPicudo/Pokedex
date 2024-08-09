//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 08/08/24.
//

import SwiftUI
import Combine // Necesario para el uso de variables observables, sin embargo, SwiftUI agrega muchas de los métodos de Combine automáticamente.

class PokemonViewModel: ObservableObject {
    
    // Creamos un arreglo de todos los objetos que queremos obtener.
    @Published var pokemon = PokemonModel()
    
    /// Esta función toma el nombre del pokemon como parámetro y prepara la URL necesaria para hacer la llamada a la API
    func fetchData(endpoint: String) {
        // Creamos de manera segura el URL para hacer la consulta de la API
        if let url = URL(string: endpoint) {
            // Creamos una URLSession para poder acceder a los métodos de comunicación entre nuestra aplicación y una API.
            let session = URLSession(configuration: .default)
            // Creamos una tarea de nuestra URLSession, que se va a encargar de ingresar a la dirección web de la URL.
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    // Nos interesa los datos que se obtienen de esta tarea.
                    if let safeData = data {
                        do {
                            let pokemon = try decoder.decode(PokemonModel.self, from: safeData)
                            // Usamos el DispatchQueue para que no se congele la interfaz en lo que se obtienen los datos de la API.
                            DispatchQueue.main.async {
                                self.pokemon = pokemon
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
