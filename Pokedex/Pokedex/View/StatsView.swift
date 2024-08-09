//
//  StatsView.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 09/08/24.
//

import SwiftUI

struct StatsView: View {
    var stat: Stats
    
    var image: String {
        switch stat.statDetail.name {
        case "hp": 
            return "heart.circle.fill"
        case "attack":
            return "figure.strengthtraining.traditional"
        case "defense":
            return "shield.lefthalf.filled"
        case "special-attack":
            return "lightspectrum.horizontal"
        case "special-defense":
            return "staroflife.shield"
        case "speed":
            return "hare.circle.fill"
        default:
            return ""
        }
    }
    
    var color: Color {
        switch stat.statDetail.name {
        case "hp":
            return Color.red
        case "attack":
            return Color.yellow
        case "defense":
            return Color.blue
        case "special-attack":
            return Color.red
        case "special-defense":
            return Color.gray
        case "speed":
            return Color.purple
        default:
            return Color.clear
        }
    }
    
    var name: String {
        switch stat.statDetail.name {
        case "hp":
            return "HP"
        case "attack":
            return "ATK"
        case "defense":
            return "DEF"
        case "special-attack":
            return "S-ATK"
        case "special-defense":
            return "S-DEF"
        case "speed":
            return "SPE"
        default:
            return ""
        }
    }
    
    var body: some View {
        
        HStack {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(color)
                Text(name.uppercased())
            }.frame(width: 90)
            Gauge(value: Double(stat.value), in: 0...150) {
                Text("")
            }
            .padding(.bottom)
            .tint(color)
            Text("\(stat.value)")
                .frame(width: 40)
        }
        
        
    }
}

#Preview {
    StatsView(stat: Stats(value: 130, statDetail: StatDetail(name: "special-attack")))
}
