//
//  PokemonData.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 07/08/24.
//

import SwiftUI

// El protocolo Codable se utiliza para poder codificarse en un JSON o decodificarse a partir de uno.
struct PokemonData: Codable {
    var id = UUID()
    var abilities: [Ability]
    var baseExperience: Int
    var cries: Cries
    var forms: Forms
    var gameIndices: GameIndices
    var height: Int
    var heldItems: HeldItems
    var isDefault: Bool = true
    var locationAreaEncounters: String
    var moves: Moves
    var name: String
    var order: Int
    var pastAbilities: [String]
    var pastTypes: [String]
    var species: Species
    var sprites: Sprites
    var stats: Stats
    var types: Types
    var weight: Int
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves
        case name
        case order
        case pastAbilities = "past_abilities"
        case pastTypes = "past_types"
        case species
        case sprites
        case stats
        case types
        case weight
    }
    
    // Inicializador para crear un objeto con valores predeterminados "vacíos"
        init(
            abilities: [Ability] = [],
            baseExperience: Int = 0,
            cries: Cries = Cries(),
            forms: Forms = Forms(),
            gameIndices: GameIndices = GameIndices(),
            height: Int = 0,
            heldItems: HeldItems = HeldItems(),
            isDefault: Bool = true,
            locationAreaEncounters: String = "",
            moves: Moves = Moves(),
            name: String = "",
            order: Int = 0,
            pastAbilities: [String] = [],
            pastTypes: [String] = [],
            species: Species = Species(),
            sprites: Sprites = Sprites(),
            stats: Stats = Stats(),
            types: Types = Types(),
            weight: Int = 0
        ) {
            self.abilities = abilities
            self.baseExperience = baseExperience
            self.cries = cries
            self.forms = forms
            self.gameIndices = gameIndices
            self.height = height
            self.heldItems = heldItems
            self.isDefault = isDefault
            self.locationAreaEncounters = locationAreaEncounters
            self.moves = moves
            self.name = name
            self.order = order
            self.pastAbilities = pastAbilities
            self.pastTypes = pastTypes
            self.species = species
            self.sprites = sprites
            self.stats = stats
            self.types = types
            self.weight = weight
        }
}

struct Ability: Codable, Identifiable {
    var id = UUID()
    var abilityDetail: AbilityDetail
    var isHidden: Bool
    var slot: Int
    
    enum CodingKeys: String, CodingKey {
        case abilityDetail = "ability" // Indicamos en el caso, el nombre que elegimos, y lo igualamos al nombre que aparece en el JSON
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

