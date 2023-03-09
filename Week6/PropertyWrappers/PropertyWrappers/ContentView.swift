//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
}

//class FruitViewModel: ObservableObject {
//    @Published var fruits: [FruitModel] = []
//    
//    init() {
//        getFruits()
//    }
//    
//    func getFruits() {
//        let fruit1 = FruitModel(name: "🍎 Apple", price: 10)
//        let fruit2 = FruitModel(name: "🥭 Mango", price: 20)
//        let fruit3 = FruitModel(name: "🍊 Orange", price: 30)
//        let fruit4 = FruitModel(name: "🍌 Banana", price: 40)
//        let fruit5 = FruitModel(name: "🍉 Watermelon", price: 50)
//        
//        fruits.append(fruit1)
//        fruits.append(fruit2)
//        fruits.append(fruit3)
//        fruits.append(fruit4)
//        fruits.append(fruit5)
//    }
//    
//    func addFruit(name: String, price: Int) {
//        let newFruit = FruitModel(name: name, price: price)
//        fruits.append(newFruit)
//    }
//    
//    func deleteFruit(index: IndexSet) {
//        fruits.remove(atOffsets: index)
//    }
//}

struct ContentView: View {
    
    @StateObject var fruitViewModel: FruitViewModel =  FruitViewModel()
//    @State var fruits: [FruitModel] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruitViewModel.fruits) { fruit in
                    NavigationLink {
//                        FruitView(fruitViewModel: fruitViewModel, fruitName: fruit.name)
                        FruitView(fruitName: fruit.name)
                    } label: {
                        HStack {
                            Text("\(fruit.name)")
                            Spacer()
                            Text("$ \(fruit.price)")
                        }
                    }
                }.onDelete { index in
                    fruitViewModel.deleteFruit(index: index)
                }
            }
            .navigationTitle("Fruits")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            fruitViewModel.addFruit(name: "Pineapple", price: 60)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
        }.environmentObject(fruitViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
