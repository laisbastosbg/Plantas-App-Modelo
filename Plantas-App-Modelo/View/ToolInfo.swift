//
//  ToolInfo.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 03/02/25.
//

import SwiftUI

struct ToolInfo: View {
    var body: some View {
            VStack {
                HStack {
                    Text("1.3")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text("Ferramentas")
                        .font(.title)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: WeatherInfo()) {
                        Text("1.4 Clima")
                            .foregroundStyle(Color("primary"))
                            .padding()
                            .border(Color("primary"))
                    }
                    .padding()
                }
            }
        .navigationTitle("Ferramentas")
    }
}
