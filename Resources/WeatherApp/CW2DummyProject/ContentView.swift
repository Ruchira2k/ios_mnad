//
//  ContentView.swift
//  CW2DummyProject
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // View that shows basic items
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            // View to search weather details of cities
            DetailView()
                .tabItem {
                    Label("Details", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
