//
//  PizzaView.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-02.
//

import SwiftUI

struct PizzaView: View {
//    var pizzaName: String = ""
//    var imageName: String = ""
//    var ingredients: String = ""
//
//    private var ingredientList = ingredients.components(separatedBy: ",")
    
    var pizzaName: String = ""
    var imageName: String = ""
    var ingredients: String = ""
    private var ingredientList: [String]
    
    init(pizzaName: String, imageName: String, ingredients: String) {
        self.pizzaName = pizzaName
        self.imageName = imageName
        self.ingredients = ingredients
        self.ingredientList = ingredients.components(separatedBy: ",")
    }
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("\(imageName)")
                    .resizable()
                    .frame(height: 180)
                
                Form{
                    Section {
                        List {
                            ForEach(ingredientList, id: \.self) { ingredient in
                                Text(ingredient)
                            }
                        }
                    } header: {
                        Text("Ingredients").font(.system(size: 20))
                    }
                }
                
            }.navigationTitle(pizzaName)
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

//struct PizzaView_Previews: PreviewProvider {
//    static var previews: some View {
//        PizzaView()
//    }
//}
