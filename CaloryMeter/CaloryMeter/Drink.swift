//
//  Drink.swift
//  CaloryMeter
//
//  Created by naseem on 15/01/2022.
//

import Foundation

struct Drink: Identifiable, Codable {
    var id: UUID
    var name: String
    
    static let example = Drink(id: UUID(), name: "Example Drink")
}
