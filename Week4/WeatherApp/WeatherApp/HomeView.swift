//
//  HomeView.swift
//  WeatherApp
//
//  Created by Ruchira Sahabandu  on 2023-02-17.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var networkStore = NetworkStore()
    
    var body: some View {
//        ZStack{
//            LinearGradient(colors: [.cyan, .blue],
//                                   startPoint: .top,
//                           endPoint: .center).ignoresSafeArea()
            VStack(spacing: 20){
                if let weatherData = networkStore.weatherData {
                    Text(weatherData.name)
                        .font(.title)
                        .fontWeight(.light)
                    
                    Text("\(Date().formatted())")
                    
                    Text("\(weatherData.formattedTemp)ºC")
                        .font(.system(size: 55)).bold()
                    
                    Text(weatherData.description)
                        .font(.title).bold()
                } else {
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                }
                
            }.task {
                await networkStore.fetchData(cityName: "colombo")
            }
//        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
