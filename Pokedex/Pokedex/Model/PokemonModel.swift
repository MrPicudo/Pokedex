//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 07/08/24.
//

import SwiftUI

// El protocolo Codable se utiliza para poder codificarse en un JSON o decodificarse a partir de uno.
struct PokemonModel: Codable {
    var id = UUID()
    var abilities: [Ability]
    var moves: [Moves]
    var name: String
    var sprites: Sprites
    var stats: [Stats]
    var types: [Types]
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case moves
        case name
        case sprites
        case stats
        case types
    }
    
    // Inicializador para crear un objeto con valores predeterminados "vacíos"
        init(
            abilities: [Ability] = [],
            moves: [Moves] = [],
            name: String = "",
            sprites: Sprites = Sprites(frontDefault: "", backDefault: ""),
            stats: [Stats] = [],
            types: [Types] = []
        ) {
            self.abilities = abilities
            self.moves = moves
            self.name = name
            self.sprites = sprites
            self.stats = stats
            self.types = types
        }
}

struct Ability: Codable, Identifiable {
    var id = UUID()
    var abilityDetail: AbilityDetail
    var isHidden: Bool
    var slot: Int
    
    enum CodingKeys: String, CodingKey {
        case abilityDetail = "ability" // Indicamos en el caso, el nombre que elegimos, y le asignamos el nombre que aparece en el JSON
        case isHidden = "is_hidden"
        case slot // Si el nombre que elegimos es igual al nombre que viene en el JSON, no es necesario indicar la asignación.
    }
}

struct AbilityDetail: Codable, Identifiable {
    var id = UUID()
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct Moves: Codable, Identifiable {
    var id = UUID()
    var moveDetail: MoveDetail
    
    enum CodingKeys: String, CodingKey {
        case moveDetail = "move"
    }
}

struct MoveDetail: Codable, Identifiable {
    var id = UUID()
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct Sprites: Codable {
    var frontDefault: String
    var backDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
    }
}

struct Stats: Codable, Identifiable {
    var id = UUID()
    var value: Int
    var statDetail: StatDetail
    
    enum CodingKeys: String, CodingKey {
        case value = "base_stat"
        case statDetail = "stat"
    }
}

struct StatDetail: Codable {
    var id = UUID()
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct Types: Codable, Identifiable {
    var id = UUID()
    var slot: Int
    var typeDetail: TypeDetail
    
    enum CodingKeys: String, CodingKey {
        case slot
        case typeDetail = "type"
    }
}

struct TypeDetail: Codable, Identifiable {
    var id = UUID()
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
