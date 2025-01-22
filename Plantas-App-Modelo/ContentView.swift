//
//  ContentView.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 16/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationStack {
            ScrollView(.horizontal) {
                HStack(spacing: 25) {
                    PlantOption(index: "I", title: "Manjericão", image: "Basil-PLACEHOLDER", buttonText: "Aprender")
                    
                    PlantOption(index: "II", title: "Coentro", image: "Coriander-PLACEHOLDER", buttonText: "Aprender")
                    
                    PlantOption(index: "III", title: "Cebolinha", image: "Scallions-PLACEHOLDER", buttonText: "Aprender")
                }
                .scrollTargetLayout()
            }
//            .contentMargins(50, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
//        }
    }
}

struct PlantOption: View {
    
    var index: String
    
    var title: String
    
    var image: String
    
    var buttonText: String
    
    var body: some View {
        VStack {
            Text(index)
                .font(.largeTitle)
                .bold()
            Text(title)
                .font(.title)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 50)
            Button(action: {}, label: {
                Text(buttonText)
            })
            .padding()
            .border(.accent)
        }
        .padding()
        .scrollTransition { content, phase in
            content
                .opacity(phase.isIdentity ? 1 : 0.5) // Apply opacity animation
                .scaleEffect(y: phase.isIdentity ? 1 : 0.7) // Apply scale animation
        }
    }
}

#Preview {
    ContentView()
}


