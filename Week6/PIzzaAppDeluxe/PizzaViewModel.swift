//
//  PizzaViewModel.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-02.
//

import Foundation
import CoreData

class PizzaViewModel: ObservableObject {
    
    @Published var savedPizzaData: [PizzaEntity] = []
    @Published var pizzas: [Pizza] = []
    var pizzaData = PizzaData()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "PizzaDataContainer")
        container.loadPersistentStores { dscription, error in
            if let error = error {
                print("Error in loading data.\(error)")
            } else {
                print("Successfully loaded core data.")
            }
        }
//        getPizzas()
        fetchData()
    }
    
    func getPizzas() {
        fetchData()
        pizzas.append(pizzaData.pizza1)
        pizzas.append(pizzaData.pizza2)
        pizzas.append(pizzaData.pizza3)
        pizzas.append(pizzaData.pizza4)
        pizzas.append(pizzaData.pizza5)
        
        for pizza in savedPizzaData {
            let pizzaType = PizzaType(rawValue: pizza.pizzaType ?? "meat")
            
            let newPizza = Pizza(name: pizza.name ?? "", imageName: pizza.imageName ?? "", thumbnailName: pizza.thumbnailName ?? "", ingredients: pizza.ingredients ?? "", type: pizzaType ?? PizzaType.meat, isFavorite: pizza.isFavorite)
            
            pizzas.append(newPizza)
        }
        
        print("test")
    }
    
    func fetchData() {
        let request = NSFetchRequest<PizzaEntity>(entityName: "PizzaEntity")
        
        do {
            savedPizzaData = try container.viewContext.fetch(request)
        } catch let error {
            print("Error while fetching data. \(error)")
        }
//        saveData()
    }
    
    func addPizzaData(name: String, ingredients: String, imageName: String, thumbnailName: String, pizzaType: String, isFavorite: Bool) {
        let newPizza = PizzaEntity(context: container.viewContext)
        
        newPizza.name = name
        newPizza.ingredients = ingredients
        newPizza.imageName = imageName
        newPizza.thumbnailName = thumbnailName
        newPizza.pizzaType = pizzaType
        newPizza.isFavorite = isFavorite
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch let error {
            print("Error while saving data. \(error)")
        }
    }
    
    func filterPizzaWithType(pizzaType: String) -> [PizzaEntity] {
        return savedPizzaData.filter { $0.pizzaType == pizzaType }
    }
    
    func updateIsFavorite() {
        
    }
    
    func filterFavorites(isFavorite: Bool) -> [PizzaEntity] {
        return savedPizzaData.filter { $0.isFavorite == isFavorite }
    }
    
}
