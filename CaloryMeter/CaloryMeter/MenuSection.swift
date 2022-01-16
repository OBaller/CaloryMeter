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
    
    func matches (for search: String) -> [Drink ] {
        let trimmed = search.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty { return drinks }
        
        return drinks.filter {
            $0.name.localizedCaseInsensitiveContains(trimmed)
        }
    }
}
