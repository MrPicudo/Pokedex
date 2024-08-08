//
//  ListView.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 07/08/24.
//

import SwiftUI

struct ListView: View {
    
    // Creamos un objeto que transmitirá toda la información recibida de la API.
    @ObservedObject var apiManager = APIManager()
    
    var body: some View {
        NavigationStack {
            List(apiManager.results) { pokemon in
                Text(pokemon.name)
            }
            VStack {
                Button {
                    print(apiManager.results)
                } label: {
                    Text("Ver lista de Pokemons")
                }

            }
        }
        .onAppear {
            self.apiManager.fetchData()
        }
    }
}

#Preview {
    ListView()
}
