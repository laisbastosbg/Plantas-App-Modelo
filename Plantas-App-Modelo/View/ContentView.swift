//
//  ContentView.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 16/01/25.
//

import SwiftUI

struct ContentView: View {
    let jsonManager = JSONFileManager.shared
    
    var body: some View {
        NavigationStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 25) {
                        PlantOption(index: "I", title: "Manjericão", image: "basil", destination: PlantInfo())
                        
                        PlantOption(index: "II", title: "Coentro", image: "cilantro", destination: EmptyView(), isLocked: true)
                        
                        PlantOption(index: "III", title: "Cebolinha", image: "cilantro", destination: EmptyView(), isLocked: true)
                    }
                    .scrollTargetLayout()
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                .background(Color("background"))
        }
        .onAppear {
            let jsonManager = JSONFileManager.shared
            
            jsonManager.read()
        }
    }
}

struct PlantOption<Destination: View>: View {
    
    var index: String
    
    var title: String
    
    var image: String
    
//    var buttonText: String
    
    var destination: Destination
    
    var isLocked = false
    
    var body: some View {
        VStack {
            VStack {
                Text(index)
                    .font(Font.custom("InknutAntiqua-ExtraBold", size: 44))
                    .foregroundStyle(Color("primary"))
                    .padding(Edge.Set.bottom, -80)
                Text(title)
                    .font(Font.custom("InknutAntiqua-Medium", size: 24))
                    .foregroundStyle(Color("primary"))
            }
            ZStack {
                Image("Rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(Edge.Set.bottom, 40)
                    .frame(width: UIScreen.main.bounds.width - 60)
                VStack {
                    Image("icon")
                        .offset(y: -30)
                        .opacity(isLocked ? 0 : 100)
                    Image(isLocked ? "locked" : image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 50)
                    NavigationLink(destination: destination) {
                        Text(isLocked ? "Em breve" : "Aprender")
                            .foregroundStyle(isLocked ? Color.gray : Color("primary"))
                            .padding()
                            .background(Color("background"))
                            .border(isLocked ? Color.gray : Color("primary"))
                    }
                    .offset(y: 30)
                    .padding(Edge.Set.bottom, 40)
                }
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


