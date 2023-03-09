//
//  ContentView.swift
//  AppStorage
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import SwiftUI

struct ContentView: View {
//    @State var name: String = ""
    @AppStorage("username") var name: String = ""
    
    var body: some View {
        VStack(spacing: 20){
            TextField("Enter your name", text: $name).textFieldStyle(.roundedBorder)
            
            Button {
                // Saving data into storage
//                UserDefaults.standard.setValue(name, forKey: "username")
            } label: {
                Text("Save")
            }
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
//            name = UserDefaults.standard.string(forKey: "username") ?? ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
