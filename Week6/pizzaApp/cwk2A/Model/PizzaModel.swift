//
//  PizzaModel.swift
//  cwk2A
//
// Edited by Girish on 10/12/2021.
//


import Foundation

class PizzaModel {
    
    var pizzas: [Pizza] = []
    
    init() {
        if let url = Bundle.main.url(forResource: "PizzaResources/pizzas", withExtension: "json") {
            do {
                
                let data = try Data(contentsOf: url)
                
                pizzas = try JSONDecoder().decode([Pizza].self, from: data)
                

            } catch {
                print(error)
            }
        }
    }
    
    func pizzas(forType type: PizzaType?) -> [Pizza] {
        guard let type = type else { return pizzas }
        return pizzas.filter { $0.type == type }
    }
    func add(pizza: Pizza) {
            pizzas.append(pizza)
        }
}

