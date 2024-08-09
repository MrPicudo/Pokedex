//
//  ListView.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 07/08/24.
//

import SwiftUI
import Combine // Necesario para el uso de variables observables, sin embargo, SwiftUI agrega muchas de los métodos de Combine automáticamente.

struct ListView: View {
    
    // Creamos un objeto que transmitirá toda la información recibida de la API.
    @StateObject var apiListManager = APIListManager()
    // Variable para el cuadro de búsqueda
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            List(searchResults) { pokemon in
                NavigationLink {
                    PokemonView(urlString: pokemon.url)
                } label: {
                    HStack {
                        Text(pokemon.name.prefix(1).uppercased() + pokemon.name.dropFirst())
                        Image(systemName: "globe")
                    }
                }
            }
        }
        .onAppear {
            self.apiListManager.fetchData()
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Results] {
        if searchText.isEmpty {
            return apiListManager.results
        } else {
            return apiListManager.results.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
}

#Preview {
    ListView()
}
