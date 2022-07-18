//
//  Serving.swift
//  CoolBeans
//
//  Created by Livia Soare on 16.07.2022.
//

import Foundation

struct Serving: Identifiable, Codable, Equatable{
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
}
