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
    @ObservedObject var apiListManager = APIListManager()
    
    var body: some View {
        NavigationStack {
            List(apiListManager.results) { pokemon in
                HStack {
                    Text(pokemon.name)
                    NavigationLink {
                        PokemonView(urlString: pokemon.url)
                    } label: {
                        Text("")
                    }
                }
            }
            VStack {
                Button {
                    print(apiListManager.results)
                } label: {
                    Text("Ver lista de Pokemons")
                }
            }
        }
        .onAppear {
            self.apiListManager.fetchData()
        }
    }
}

#Preview {
    ListView()
}
