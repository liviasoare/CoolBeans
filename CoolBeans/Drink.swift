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
    let caffeine: [Int];
    let coffeeBased: Bool;
    let servedWithMilk: Bool;
    let baseCalories: Int;
    
    var image: String{
        name.lowercased().replacingOccurrences(of: " ", with: "-");
    }
    
//    example value
    static let example = Drink(id: UUID(), name: "Example Drink", caffeine: [60, 120, 200], coffeeBased: true, servedWithMilk: true, baseCalories: 100)
    
}
