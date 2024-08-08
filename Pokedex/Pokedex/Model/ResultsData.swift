//
//  ResultsData.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 08/08/24.
//

import Foundation

struct ResultsData: Codable, Identifiable {
    var id = UUID()
    let count: Int
    let next: String?
    let previous: String?
    let results: [Results]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}

// Todos los atributos de una estructura que adopta el protocolo "Decodable", también tienen que ser "Decodable".
struct Results: Codable, Identifiable {
    var id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
