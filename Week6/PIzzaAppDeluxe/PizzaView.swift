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
    var selectedPizza: PizzaEntity
    @ObservedObject var pizzaViewModel: PizzaViewModel
    var pizzaName: String = ""
    var imageName: String = ""
    var ingredients: String = ""
    @State var isFavorite: Bool = true
    private var ingredientList: [String]
    
    init(selectedPizza: PizzaEntity, pizzaViewModel: PizzaViewModel) {
        self.selectedPizza = selectedPizza
        self.pizzaViewModel = pizzaViewModel
        self.pizzaName = selectedPizza.name ?? ""
        self.imageName = selectedPizza.imageName ?? ""
        self.ingredients = selectedPizza.ingredients ?? ""
        self.isFavorite = selectedPizza.isFavorite
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
                    
                    Toggle("Favorite", isOn: $isFavorite)
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
