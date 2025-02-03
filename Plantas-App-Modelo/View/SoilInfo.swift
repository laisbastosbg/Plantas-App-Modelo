//
//  SoilInfo.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 03/02/25.
//

import SwiftUI

struct SoilInfo: View {
    var body: some View {
            VStack {
                HStack {
                    Text("1.2")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text("Solo")
                        .font(.title)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: ToolInfo()) {
                        Text("1.3 Ferramentas")
                            .foregroundStyle(Color("primary"))
                            .padding()
                            .border(Color("primary"))
                    }
                    .padding()
                }
            }
        .navigationTitle("Solo")
    }
}
