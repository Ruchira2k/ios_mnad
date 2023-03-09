//
//  MockData.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-02.
//

import Foundation

class PizzaData: ObservableObject {
    let pizza1 = Pizza(name: "Beef Sizzler", imageName: "beef_sizzler", thumbnailName: "thumbnail_beef_sizzler", ingredients: "Green Chillies, Jalapenõs, Red Onions, Seasoned Minced Beef", type: PizzaType.meat)
    let pizza2 = Pizza(name: "Chicken Sizzler", imageName: "chicken_sizzler", thumbnailName: "thumbnail_chicken_sizzler", ingredients: "Green Chillies, Jalapenõs, Red Onions, Chicken", type: PizzaType.meat)
    let pizza3 = Pizza(name: "Hawaiian", imageName: "hawaiian", thumbnailName: "thumbnail_hawaiian", ingredients: "Green Chillies, Jalapenõs, Red Onions, Chicken, Seasoned Minced Beef", type: PizzaType.meat)
    let pizza4 = Pizza(name: "Veg Sizzler", imageName: "veg_sizzler", thumbnailName: "thumbnail_veg_sizzler", ingredients: "Mushrooms, Mixed Peppers, Red Onions, Tomato", type: PizzaType.veg)
    let pizza5 = Pizza(name: "Veg Supreme", imageName: "veg_supreme", thumbnailName: "thumbnail_veg_supreme", ingredients: "Green Chillies, Jalapenõs, Mixed Peppers, Red Onions", type: PizzaType.veg)
}
