//
//  JSONFileManager.swift
//  Plantas-App-Modelo
//
//  Created by Lais Godinho on 01/04/25.
//

import Foundation

class JSONFileManager {
    
    public static var shared = JSONFileManager(fileName: "Plants")
    
    var contents = [PlantDetails]()
    
    var data: Data
    
    private init(fileName: String) {
        
        guard  let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError()
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        
        self.data = data
    }
    
    func read() {
        let decoder = JSONDecoder()
        
        
        do {
            let decodedContents = try decoder.decode([PlantDetails].self, from: data)
            self.contents = decodedContents
        } catch {
            print("Error decoding JSON: \(error)")
            fatalError("Decoding failed")
        }
    }
}
