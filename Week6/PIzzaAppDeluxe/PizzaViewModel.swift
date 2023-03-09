//
//  PizzaViewModel.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-02.
//

import Foundation

class PizzaViewModel: ObservableObject {
    
    @Published var pizzas: [Pizza] = []
    var pizzaData = PizzaData()
    
    init() {
        getPizzas()
    }
    
    func getPizzas() {
        pizzas.append(pizzaData.pizza1)
        pizzas.append(pizzaData.pizza2)
        pizzas.append(pizzaData.pizza3)
        pizzas.append(pizzaData.pizza4)
        pizzas.append(pizzaData.pizza5)
    }
    
}
