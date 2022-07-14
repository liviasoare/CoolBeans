//
//  Drink.swift
//  CoolBeans
//
//  Created by Livia Soare on 15.07.2022.
//

import Foundation

struct Drink: Identifiable, Codable {
    let id: UUID;
    let name: String;
    
    var image: String{
        name.lowercased().replacingOccurrences(of: " ", with: "-");
    }
    
//    example value
    static let example = Drink(id: UUID(), name: "Example Drink")
    
}
