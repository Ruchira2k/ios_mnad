//
//  DetailView.swift
//  CW2DummyProject
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import SwiftUI

struct DetailView: View {

    @State private var searchText = ""
    let data = ["a", "b", "c", "d", "e", "f"]

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        TextField("Search for City", text: $searchText)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            // To some task
                        } label: {
                            Text("Search")
                        }
                    }
                    .padding()
                    // List to show fetched data
                    List {
                        ForEach(0..<data.endIndex) { idx in
                            HStack {
                                Image(systemName: "bin")
                                    .foregroundColor(.red)
                                Text("Hello")
                                    .font(.system(size: 18, weight: .regular, design: .rounded))
                                Spacer()
                                Text("world \(idx)")
                                    .font(.system(size: 22, weight: .bold, design: .rounded))
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    Spacer()

                }
            }
            .navigationTitle("Weather")
        }
        .onAppear {

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

