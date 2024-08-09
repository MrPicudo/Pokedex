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
    @StateObject var apiListManager = ListViewModel()
    // Variable para el cuadro de búsqueda
    @State private var searchText: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationStack {
                ScrollView {
                    ForEach(searchResults) { pokemon in
                        NavigationLink {
                            PokemonView(urlString: pokemon.url)
                        } label: {
                            ItemView(urlString: pokemon.url)
                                .foregroundColor(Color.primary)
                                .padding(.horizontal)
                        }
                    }
                }
                .background(colorScheme == .dark ? .gray.opacity(0.2) : .gray.opacity(0.5)) // Este es el que funciona
                .navigationTitle("Pokedex Asteci")
            }
            .onAppear {
                self.apiListManager.fetchData()
            }
            .searchable(text: $searchText)
            
        }
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
