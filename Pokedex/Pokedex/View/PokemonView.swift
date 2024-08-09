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
    @StateObject var data = APIPokemonManager()
    
    var urlImage: String {
        data.pokemon.sprites.frontDefault
    }
    
    var body: some View {
        VStack {
            // Imagen obtenida de un URL de la llamada a la API
            AsyncImage(url: URL(string: urlImage)) { image in
                image
                    .resizable()
                    .frame(width: 250, height: 250)
            } placeholder: {
                ProgressView()
            }
            // Nombre del pokemon
            Text(data.pokemon.name.prefix(1).uppercased() + data.pokemon.name.dropFirst())
                .font(.title)
                .padding(.bottom)
            // Tipo de Pokemon
            Text("Tipos:")
                .font(.title2)
            ForEach(data.pokemon.types) { type in
                Text(type.typeDetail.name.prefix(1).uppercased() + type.typeDetail.name.dropFirst())
            }
            // Lista de habilidades (corta)
            Text("Habilidades")
                .font(.title2)
            ForEach(data.pokemon.abilities) { ability in
                Text(ability.abilityDetail.name)
            }
            // Lista de estadísticas (corta)
            Text("Estadísticas")
                .font(.title2)
            ForEach(data.pokemon.stats) { stat in
                Text(stat.statDetail.name.prefix(1).uppercased() + stat.statDetail.name.dropFirst() + ": \(stat.value)")
            }
            // Lista de movimientos (larga)
            Text("Movimientos")
                .font(.title2)
            ScrollView {
                ForEach(data.pokemon.moves) { move in
                    Text(move.moveDetail.name)
                }
            }
            
            
        }
        .onAppear {
            self.data.fetchData(endpoint: urlString)
            print(data.pokemon)
        }
    }
    
}

#Preview {
    PokemonView(urlString: "https://pokeapi.co/api/v2/pokemon/1/")
}
