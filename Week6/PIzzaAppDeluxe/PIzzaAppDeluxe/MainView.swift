//
//  MainView.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import SwiftUI

struct MainView: View {
    
    @State var pizzaTypes: Int = 0
    @State private var isSheetShowing = false
    @StateObject var pizzaViewModel: PizzaViewModel = PizzaViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Picker("FoodTypes", selection: $pizzaTypes) {
                    Text("🍕 All").tag(0)
                    Text("🥩 Meat").tag(1)
                    Text("🥗 Veggie").tag(2)
                }.padding()
                .pickerStyle(.segmented)
                List {
                    if pizzaTypes == 0 {
                        ForEach(pizzaViewModel.pizzas) { pizza in
                            NavigationLink {
                                PizzaView(pizzaName: pizza.name, imageName: pizza.imageName, ingredients: pizza.ingredients)
                            } label: {
                                HStack {
                                    Image("\(pizza.thumbnailName)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 90)
                                        .cornerRadius(5)
                                    Text("\(pizza.name)").padding(.leading, 10)
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 20))
                        }
                    } else if pizzaTypes == 1 {
                        ForEach(pizzaViewModel.pizzas) { pizza in
                            if pizza.type == PizzaType.meat {
                                NavigationLink {
                                    PizzaView(pizzaName: pizza.name, imageName: pizza.imageName, ingredients: pizza.ingredients)
                                } label: {
                                    HStack {
                                        Image("\(pizza.thumbnailName)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 90)
                                            .cornerRadius(5)
                                        Text("\(pizza.name)").padding(.leading, 10)
                                    }
                                }
                                .listRowInsets(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 20))
                            }
                            
                        }
                    } else {
                        ForEach(pizzaViewModel.pizzas) { pizza in
                            if pizza.type == PizzaType.veg {
                                NavigationLink {
                                    PizzaView(pizzaName: pizza.name, imageName: pizza.imageName, ingredients: pizza.ingredients)
                                } label: {
                                    HStack {
                                        Image("\(pizza.thumbnailName)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 90)
                                            .cornerRadius(5)
                                        Text("\(pizza.name)").padding(.leading, 10)
                                    }
                                }
                                .listRowInsets(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 20))
                            }
                            
                        }
                    }
                    
                }
                .listStyle(PlainListStyle())
                .padding(.top, 15)
            }
            .navigationTitle("PizzaList").navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isSheetShowing.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $isSheetShowing) {
                    AddNewPizzaView()
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
