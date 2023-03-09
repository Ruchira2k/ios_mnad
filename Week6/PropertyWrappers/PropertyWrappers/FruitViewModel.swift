//
//  FruitViewModel.swift
//  PropertyWrappers
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import Foundation

class FruitViewModel: ObservableObject {
    @Published var fruits: [FruitModel] = []
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "🍎 Apple", price: 10)
        let fruit2 = FruitModel(name: "🥭 Mango", price: 20)
        let fruit3 = FruitModel(name: "🍊 Orange", price: 30)
        let fruit4 = FruitModel(name: "🍌 Banana", price: 40)
        let fruit5 = FruitModel(name: "🍉 Watermelon", price: 50)
        
        fruits.append(fruit1)
        fruits.append(fruit2)
        fruits.append(fruit3)
        fruits.append(fruit4)
        fruits.append(fruit5)
    }
    
    func addFruit(name: String, price: Int) {
        let newFruit = FruitModel(name: name, price: price)
        fruits.append(newFruit)
    }
    
    func deleteFruit(index: IndexSet) {
        fruits.remove(atOffsets: index)
    }
}
