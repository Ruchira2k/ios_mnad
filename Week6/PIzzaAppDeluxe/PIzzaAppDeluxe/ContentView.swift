//
//  ContentView.swift
//  PIzzaAppDeluxe
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PizzaViewModel()
    
    var body: some View {
        TabView {
            MainView(pizzaViewModel: viewModel).tabItem{
                Label("PizzaList", systemImage: "list.dash")
                
            }
            
            FavoritesView(pizzaViewModel: viewModel).tabItem{
                Label("Favorites", systemImage: "star.fill")
            }
        }
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
