//
//  AddNewPizzaView.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import SwiftUI

struct AddNewPizzaView: View {
    
    @State private var name: String = ""
    @State private var ingredients: String = ""
    @State private var imageName: String = ""
    @State private var imageThumbnailName: String = ""
    @State private var pizzaType: String = PizzaType.meat.rawValue
//    @State private var pizzaTypes: Int = 0
    @State private var isFavorite: Bool = false
    
    @ObservedObject var pizzaViewModel: PizzaViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    TextField("Name", text: $name)
                } header: {
                    Text("Pizza Name")
                }
                
                Section {
                    TextEditor(text: $ingredients).frame(minHeight: 180)
                } header: {
                    Text("Ingredients")
                }
                
                Section {
                    TextField("Image Name", text: $imageName)
                    TextField("Image Thumbnail Name", text: $imageThumbnailName)
                } header: {
                    Text("Image Details")
                }
                
                Picker("Pizza Type", selection: $pizzaType) {
                    Text("🥩 Meat").tag(PizzaType.meat.rawValue)
                    Text("🥗 Veggie").tag(PizzaType.veg.rawValue)
                }
                
                Toggle("Favorite", isOn: $isFavorite)
                
            }.navigationTitle("New Pizza").navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            savePizza()
                            dismiss()
                        }
                    }
                }
        }
        
    }
    
    func savePizza() {
        pizzaViewModel.addPizzaData(name: name, ingredients: ingredients, imageName: imageName, thumbnailName: imageThumbnailName, pizzaType: pizzaType, isFavorite: isFavorite)
    }
}

struct AddNewPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPizzaView(pizzaViewModel: PizzaViewModel())
    }
}
