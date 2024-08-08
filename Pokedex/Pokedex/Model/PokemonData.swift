//
//  PokemonData.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 07/08/24.
//

import Foundation

// El protocolo Codable se utiliza para poder codificarse en un JSON o decodificarse a partir de uno.
struct PokemonData: Decodable {
    let abilities: Abilities
    let baseExperience: Int
    let cries: Cries
    let forms: Forms
    let gameIndices: GameIndices
    var height: Int
    let heldItems: HeldItems
    let id: Int
    var isDefault: Bool = true
    let locationAreaEncounters: String
    let moves: Moves
    var name: String
    let order: Int
    let pastAbilities: [String]
    let pastTypes: [String]
    let species: Species
    let sprites: Sprites
    let stats: Stats
    let types: Types
    var weight: Int
}

struct Abilities: Codable {
    
}

struct Cries: Codable {
    
}

struct Forms: Codable {
    
}

struct GameIndices: Codable {
    
}

struct HeldItems: Codable {
    
}

struct Moves: Codable {
    
}

struct Species: Codable {
    
}

struct Sprites: Codable {
    
}

struct Stats: Codable {
    
}

struct Types: Codable {
    
}

