//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ruchira Sahabandu  on 2023-02-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            SearchView().tabItem{
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
