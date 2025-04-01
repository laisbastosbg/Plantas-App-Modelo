//
//  PlantDetails.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 01/04/25.
//

struct PlantDetails: Decodable {
    var name: String
    var plant_information: String
    var cultivation_tips: [String]
    var trivia: [String]
    var soil_information: String
    var soil_enhancement_tips: [String]
    var draining_test: String
    var tools_information: String
    var essential_tools: [String]
    var climate_information: String
    var plant_protection: [String]
    var location_adaptation: String
    var image: String
}
