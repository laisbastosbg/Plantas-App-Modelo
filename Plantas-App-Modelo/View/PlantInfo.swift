//
//  PlantInfo.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 03/02/25.
//

import SwiftUI

struct PlantInfo: View {
    var body: some View {
            VStack {
                HStack {
                    Text("1.1")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text("Manjericão")
                        .font(.title)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: SoilInfo()) {
                        Text("1.2 Solo")
                            .foregroundStyle(Color("primary"))
                            .padding()
                            .border(Color("primary"))
                    }
                    .padding()
                }
            }
        .navigationTitle("Manjericão")
    }
}
