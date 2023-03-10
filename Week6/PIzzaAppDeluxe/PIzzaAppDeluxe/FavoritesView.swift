//
//  FavoritesView.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var pizzaViewModel: PizzaViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pizzaViewModel.filterFavorites(isFavorite: true)) { pizza in
                    NavigationLink {
                        PizzaView(selectedPizza: pizza, pizzaViewModel: pizzaViewModel)
                    } label: {
                        HStack {
                            Image("\(pizza.thumbnailName ?? "")")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 90)
                                .cornerRadius(5)
                            Text("\(pizza.name ?? "")").padding(.leading, 10)
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 20))
                }
            }.listStyle(PlainListStyle())
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(pizzaViewModel: PizzaViewModel())
    }
}
