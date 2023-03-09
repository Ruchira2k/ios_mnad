//
//  ContentView.swift
//  EnvironmentPropertyWrapper
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .font(.title)
                .bold()
                .foregroundColor(colorScheme == .dark ? .green : .red)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
