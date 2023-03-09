//
//  Pizza.swift
//  cwk2A
//
// Edited by Girish on 10/12/2021.
//


import Foundation

struct Pizza: Decodable {
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: PizzaType
}

enum PizzaType: String, Decodable {
    case vegetarian = "vegetarian"
    case meat = "meat"
}

