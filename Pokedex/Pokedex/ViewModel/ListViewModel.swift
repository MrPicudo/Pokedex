//
//  ListViewModel.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 07/08/24.
//

import SwiftUI
import Combine // Necesario para el uso de variables observables, sin embargo, SwiftUI agrega muchas de los métodos de Combine automáticamente.

/// Maneja las solicitudes de la API de Pokemon.
class ListViewModel: ObservableObject {
    
    // Creamos un arreglo de todos los objetos que queremos obtener.
    @Published var results = [Results]()
    
    // Definimos la URL base con la que consultaremos la API
    private let endpoint = "https://pokeapi.co/api/v2/pokemon?limit=30&offset=0"
    
    /// Esta función toma el nombre del pokemon como parámetro y prepara la URL necesaria para hacer la llamada a la API
    func fetchData() {
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
                            let results = try decoder.decode(ResultsModel.self, from: safeData)
                            // Usamos el DispatchQueue para que no se congele la interfaz en lo que se obtienen los datos de la API.
                            DispatchQueue.main.async {
                                self.results = results.results
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
