//
//  MenuSection.swift
//  CaloryMeter
//
//  Created by naseem on 15/01/2022.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    var id: UUID
    var name: String
    var drinks: [Drink]
}
