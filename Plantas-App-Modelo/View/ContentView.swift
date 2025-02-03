//
//  ContentView.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 16/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("background")
            NavigationStack {
                    ScrollView(.horizontal) {
                        HStack(spacing: 25) {
                            PlantOption(index: "I", title: "Manjericão", image: "basil", buttonText: "Aprender", destination: PlantInfo())
                            
                            PlantOption(index: "II", title: "Coentro", image: "cilantro", buttonText: "Aprender", destination: EmptyView())
                            
                            PlantOption(index: "III", title: "Cebolinha", image: "scallions", buttonText: "Aprender", destination: EmptyView())
                        }
                        .scrollTargetLayout()
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                .ignoresSafeArea()
            }
        }
    }
}

struct PlantOption<Destination: View>: View {
    
    var index: String
    
    var title: String
    
    var image: String
    
    var buttonText: String
    
    var destination: Destination
    
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
            NavigationLink(destination: destination) {
                Text(buttonText)
                    .foregroundStyle(Color("primary"))
                    .padding()
                    .border(Color("primary"))
            }
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


