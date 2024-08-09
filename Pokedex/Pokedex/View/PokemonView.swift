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
    @StateObject var data = PokemonViewModel()
    
    var urlFrontImage: String {
        data.pokemon.sprites.frontDefault
    }
    
    var urlBackImage: String {
        data.pokemon.sprites.backDefault
    }
    
    var color: Color {
        switch data.pokemon.types.first?.typeDetail.name {
        case "bug":
            return Color.green.opacity(0.7)
        case "dark":
            return Color.black.opacity(0.7)
        case "dragon":
            return Color.purple.opacity(0.7)
        case "electric":
            return Color.yellow
        case "fairy":
            return Color.pink
        case "fighting":
            return Color.red
        case "fire":
            return Color.orange
        case "flying":
            return Color.teal
        case "ghost":
            return Color.indigo
        case "grass":
            return Color.green
        case "ground":
            return Color.brown.opacity(0.5)
        case "ice":
            return Color.cyan
        case "normal":
            return Color.white
        case "poison":
            return Color.purple
        case "psychic":
            return Color.pink
        case "rock":
            return Color.orange.opacity(0.7)
        case "steel":
            return Color.gray
        case "water":
            return Color.blue
        default:
            return Color.black
        }
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color(colorScheme == .dark ? .gray.opacity(0.2) : .gray.opacity(0.5))
                .ignoresSafeArea(.all)
            VStack {
                // Imagen obtenida de un URL de la llamada a la API
                RotationView(front: urlFrontImage, back: urlBackImage, color: color)
                    .padding(.horizontal)
                
                // Nombre del pokemon
                Text(data.pokemon.name.prefix(1).uppercased() + data.pokemon.name.dropFirst())
                    .font(.title)
                    .foregroundStyle(color)
                    .padding(.bottom)
                
                /* Comenzamos con el Scroll */
                ScrollView {
                    // Tipo de Pokemon
                    HStack {
                        ForEach(data.pokemon.types) { type in
                            switch(type.typeDetail.name) {
                            case "bug":
                                HStack {
                                    Image(systemName: "ant.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.green.opacity(0.7))
                                    Text("Bug")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "dark":
                                HStack {
                                    Image(systemName: "moon.stars.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.black.opacity(0.7))
                                    Text("Dark")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "dragon":
                                HStack {
                                    Image(systemName: "tortoise.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.purple.opacity(0.7))
                                    Text("Dragon")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "electric":
                                HStack {
                                    Image(systemName: "bolt.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.yellow)
                                    Text("Electric")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "fairy":
                                HStack {
                                    Image(systemName: "wand.and.stars")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.pink)
                                    Text("Fairy")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "fighting":
                                HStack {
                                    Image(systemName: "figure.boxing")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.red)
                                    Text("Fighting")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "fire":
                                HStack {
                                    Image(systemName: "flame.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.orange)
                                    Text("Fire")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "flying":
                                HStack {
                                    Image(systemName: "wind.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.teal)
                                    Text("Flying")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "ghost":
                                HStack {
                                    Image(systemName: "theatermasks.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.indigo)
                                    Text("Ghost")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "grass":
                                HStack {
                                    Image(systemName: "leaf.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.green)
                                    Text("Grass")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "ground":
                                HStack {
                                    Image(systemName: "globe.americas.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.brown.opacity(0.5))
                                    Text("Ground")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "ice":
                                HStack {
                                    Image(systemName: "snowflake.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.cyan)
                                    Text("Ice")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "normal":
                                HStack {
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.white)
                                    Text("Normal")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "poison":
                                HStack {
                                    Image(systemName: "hazardsign.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.purple)
                                    Text("Poison")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "psychic":
                                HStack {
                                    Image(systemName: "figure.mind.and.body")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.pink)
                                    Text("Psychic")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "rock":
                                HStack {
                                    Image(systemName: "stop.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.orange.opacity(0.7))
                                    Text("Rock")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "steel":
                                HStack {
                                    Image(systemName: "shield.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.gray)
                                    Text("Steel")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            case "water":
                                HStack {
                                    Image(systemName: "drop.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.blue)
                                    Text("Water")
                                        .font(.body)
                                }.padding(.horizontal)
                                
                            default:
                                HStack {
                                    Image(systemName: "questionmark.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(Color.black)
                                    Text("Unknown")
                                        .font(.body)
                                }.padding(.horizontal)
                            }
                        }
                    }
                    
                    // Lista de estadísticas
                    Text("Statistics")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    ForEach(data.pokemon.stats) { stat in
                        StatsView(stat: stat)
                            .padding(.horizontal)
                    }
                }
            }
            .onAppear {
                self.data.fetchData(endpoint: urlString)
                print(data.pokemon)
        }
        }
    }
}

#Preview {
    PokemonView(urlString: "https://pokeapi.co/api/v2/pokemon/1/")
}
