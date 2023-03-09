//
//  FruitView.swift
//  PropertyWrappers
//
//  Created by Ruchira Sahabandu  on 2023-03-01.
//

import SwiftUI

struct FruitView: View {
    
//    @StateObject var fruitViewModel: FruitViewModel
    var fruitName: String = ""
    
    var body: some View {
        NavigationStack {
            NavigationLink {
//                ThirdView(fruitViewModel: fruitViewModel)
                ThirdView()
            } label: {
                Text("\(fruitName)")
            }.navigationTitle("Selected Fruit")
        }
    }
}

struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
//        FruitView(fruitViewModel: FruitViewModel())
        FruitView()
    }
}
