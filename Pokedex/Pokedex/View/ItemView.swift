//
//  ItemView.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 09/08/24.
//

import SwiftUI

struct ItemView: View {
    let urlString: String
    @StateObject private var data = PokemonViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Group {
            if  data.pokemon.name != "" {
                // Toda la vista para cada elemento de la lista
                HStack {
                    // Imagen pequeña y redondeada del Pokemon
                    AsyncImage(url: URL(string: data.pokemon.sprites.frontDefault)) { image in
                        image
                            .resizable()
                            .frame(width: 90, height: 90)
                    } placeholder: {
                        ProgressView()
                    }
                    /* Stack con nombre y símbolos del tipo de Pokemon */
                    VStack {
                        HStack {
                            Text(data.pokemon.name.prefix(1).uppercased() + data.pokemon.name.dropFirst())
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        HStack {
                            ForEach(data.pokemon.types) { type in
                                switch(type.typeDetail.name) {
                                case "bug":
                                        HStack {
                                            Image(systemName: "ant.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.green.opacity(0.7))
                                            Text("Bug")
                                                .font(.footnote)
                                        }
                                        
                                    case "dark":
                                        HStack {
                                            Image(systemName: "moon.stars.circle.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.black.opacity(0.7))
                                            Text("Dark")
                                                .font(.footnote)
                                        }
                                        
                                    case "dragon":
                                        HStack {
                                            Image(systemName: "tortoise.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.purple.opacity(0.7))
                                            Text("Dragon")
                                                .font(.footnote)
                                        }
                                        
                                    case "electric":
                                        HStack {
                                            Image(systemName: "bolt.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.yellow)
                                            Text("Electric")
                                                .font(.footnote)
                                        }
                                        
                                    case "fairy":
                                        HStack {
                                            Image(systemName: "wand.and.stars")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.pink)
                                            Text("Fairy")
                                                .font(.footnote)
                                        }
                                        
                                    case "fighting":
                                        HStack {
                                            Image(systemName: "figure.boxing")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.red)
                                            Text("Fighting")
                                                .font(.footnote)
                                        }
                                        
                                    case "fire":
                                        HStack {
                                            Image(systemName: "flame.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.orange)
                                            Text("Fire")
                                                .font(.footnote)
                                        }
                                        
                                    case "flying":
                                        HStack {
                                            Image(systemName: "wind.circle.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.teal)
                                            Text("Flying")
                                                .font(.footnote)
                                        }
                                        
                                    case "ghost":
                                        HStack {
                                            Image(systemName: "theatermasks.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.indigo)
                                            Text("Ghost")
                                                .font(.footnote)
                                        }
                                        
                                    case "grass":
                                        HStack {
                                            Image(systemName: "leaf.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.green)
                                            Text("Grass")
                                                .font(.footnote)
                                        }
                                        
                                    case "ground":
                                        HStack {
                                            Image(systemName: "globe.americas.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.brown.opacity(0.5))
                                            Text("Ground")
                                                .font(.footnote)
                                        }
                                        
                                    case "ice":
                                        HStack {
                                            Image(systemName: "snowflake.circle.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.cyan)
                                            Text("Ice")
                                                .font(.footnote)
                                        }
                                        
                                    case "normal":
                                        HStack {
                                            Image(systemName: "circle.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.white)
                                            Text("Normal")
                                                .font(.footnote)
                                        }
                                        
                                    case "poison":
                                        HStack {
                                            Image(systemName: "hazardsign.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.purple)
                                            Text("Poison")
                                                .font(.footnote)
                                        }
                                        
                                    case "psychic":
                                        HStack {
                                            Image(systemName: "figure.mind.and.body")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.pink)
                                            Text("Psychic")
                                                .font(.footnote)
                                        }
                                        
                                    case "rock":
                                        HStack {
                                            Image(systemName: "stop.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.orange.opacity(0.7))
                                            Text("Rock")
                                                .font(.footnote)
                                        }
                                        
                                    case "steel":
                                        HStack {
                                            Image(systemName: "shield.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.gray)
                                            Text("Steel")
                                                .font(.footnote)
                                        }
                                        
                                    case "water":
                                        HStack {
                                            Image(systemName: "drop.circle.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.blue)
                                            Text("Water")
                                                .font(.footnote)
                                        }
                                        
                                    default:
                                        HStack {
                                            Image(systemName: "questionmark.circle")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundStyle(Color.black)
                                            Text("Unknown")
                                                .font(.footnote)
                                        }
                                }
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15)
                    .stroke(colorScheme == .dark ? .black.opacity(0.9) : .white.opacity(0.9), lineWidth: 4.0))
                .background(colorScheme == .dark ? .black.opacity(0.3) : .white.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            } else {
                ProgressView() // Señal de que está cargando los datos
            }
        }.onAppear {
            data.fetchData(endpoint: urlString)
        }
    }
}

#Preview {
    ItemView(urlString: "https://pokeapi.co/api/v2/pokemon/1/")
}
