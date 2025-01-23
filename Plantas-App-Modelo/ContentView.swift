//
//  ContentView.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 16/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("background")
                ScrollView(.horizontal) {
                    HStack(spacing: 25) {
                        PlantOption(index: "I", title: "Manjericão", image: "Basil-PLACEHOLDER", buttonText: "Aprender")
                        
                        PlantOption(index: "II", title: "Coentro", image: "Coriander-PLACEHOLDER", buttonText: "Aprender")
                        
                        PlantOption(index: "III", title: "Cebolinha", image: "Scallions-PLACEHOLDER", buttonText: "Aprender")
                    }
                    .scrollTargetLayout()
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
            }
            .ignoresSafeArea()
        }
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
                .foregroundStyle(Color("primary"))
            Text(title)
                .font(.title)
                .foregroundStyle(Color("primary"))
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 50)
            Button(action: {}, label: {
                Text(buttonText)
                    .foregroundStyle(Color("primary"))
            })
            .padding()
            .border(Color("primary"))
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


