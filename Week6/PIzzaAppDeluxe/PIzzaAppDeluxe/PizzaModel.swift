//
//  PizzaModel.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import Foundation

struct Pizza: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let thumbnailName: String
    let ingredients: String
    let type: PizzaType
    let isFavorite: Bool
}

enum PizzaType: String {
    case meat = "meat"
    case veg = "veg"
}
