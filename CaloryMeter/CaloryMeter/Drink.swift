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
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = Drink(id: UUID(), name: "Example Drink")
}
