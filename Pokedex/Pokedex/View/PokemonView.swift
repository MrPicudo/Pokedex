//
//  PokemonView.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 08/08/24.
//

import SwiftUI

struct PokemonView: View {
    var urlString: String
    
    // Creamos un objeto que transmitirá toda la información recibida de la API.
    @ObservedObject var apiPokemonManager = APIPokemonManager()
    
    var body: some View {
        VStack {
            Text(apiPokemonManager.pokemon.name)
            Text("\(apiPokemonManager.pokemon.weight)")
            Text("Abilities:")
            ForEach(apiPokemonManager.pokemon.abilities) { ability in
                Text(ability.abilityDetail.name)
            }
        }
        .onAppear {
            self.apiPokemonManager.fetchData(endpoint: urlString)
            print(apiPokemonManager.pokemon)
        }
    }
    
}

#Preview {
    PokemonView(urlString: "")
}
