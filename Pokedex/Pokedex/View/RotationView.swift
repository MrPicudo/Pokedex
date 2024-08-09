//
//  RotationView.swift
//  Pokedex
//
//  Created by Jose Miguel Torres Chavez Nava on 09/08/24.
//

import SwiftUI

struct RotationView: View {
    
    @State private var isFlipped = false
    @Environment(\.colorScheme) var colorScheme
    
    var front: String
    var back: String
    var color: Color
    
    var body: some View {
        VStack {
            ZStack {
                // Vista para el frente de la tarjeta.
                Group {
                    AsyncImage(url: URL(string: front)) { image in
                        image
                            .resizable()
                            .frame(width: 250, height: 250)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(minWidth: 0.0, maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .stroke(colorScheme == .dark ? color.opacity(0.6) : color, lineWidth: 3.0))
                    .background(colorScheme == .dark ? color.opacity(0.2) : color.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .opacity(isFlipped ? 0 : 1)
                    .rotation3DEffect(
                        .degrees(isFlipped ? -180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                }
                // Vista para el reverso de la tarjeta.
                Group {
                    AsyncImage(url: URL(string: back)) { image in
                        image
                            .resizable()
                            .frame(width: 250, height: 250)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(minWidth: 0.0, maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .stroke(colorScheme == .dark ? color.opacity(0.6) : color, lineWidth: 3.0))
                    .background(colorScheme == .dark ? color.opacity(0.2) : color.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .opacity(isFlipped ? 1 : 0)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 0 : 180),
                        axis: (x: 0, y: 1, z: 0)
                    )
                }
            }
            // Al tocar la tarjeta, se invierte el estado de 'isFlipped', activando la animación.
            .onTapGesture {
                withAnimation(.linear(duration: 0.3)) {
                    isFlipped.toggle()
                }
            }
        }
    }
}
