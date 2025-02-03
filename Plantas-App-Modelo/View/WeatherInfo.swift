//
//  WeatherInfo.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 03/02/25.
//

import SwiftUI

struct WeatherInfo: View {
    var body: some View {
            VStack {
                HStack {
                    Text("1.4")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text("Clima")
                        .font(.title)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: {}) {
                        Text("Iniciar plantação")
                            .foregroundStyle(Color("primary"))
                            .padding()
                            .border(Color("primary"))
                    }
                    .padding()
                }
            }
        .navigationTitle("Clima")
    }
}
