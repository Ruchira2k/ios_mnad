//
//  HomeView.swift
//  CW2DummyProject
//
//  Created by Visal Rajapakse on 2022-04-02.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.blue
                .opacity(0.3)
                .ignoresSafeArea() // To overflow from the Safe areas
            VStack {
                Image(systemName: "sun")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.blue)
                HStack {
                    Text("\(24)°C")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                    Text("|")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(.blue)
                    Text("Colombo")
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
