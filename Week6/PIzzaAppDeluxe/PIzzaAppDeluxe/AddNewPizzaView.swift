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
    @State private var pizzaType: String = ""
    @State private var pizzaTypes: Int = 0
    
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
                
                Picker("Pizza Type", selection: $pizzaTypes) {
                    Text("🥩 Meat").tag(0)
                    Text("🥗 Veggie").tag(1)
                }
            }.navigationTitle("New Pizza").navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                    }
                }
        }
        
    }
}

struct AddNewPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPizzaView()
    }
}
