//
//  Serving.swift
//  CaloryMeter
//
//  Created by naseem on 15/01/2022.
//

import Foundation
struct Serving: Identifiable, Codable, Equatable {
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int 
}
