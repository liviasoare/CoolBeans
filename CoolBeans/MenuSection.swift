//
//  MenuSection.swift
//  CoolBeans
//
//  Created by Livia Soare on 15.07.2022.
//

import Foundation

struct MenuSection: Identifiable, Codable{
    let id: UUID;
    let name: String;
    let drinks: [Drink]
}
