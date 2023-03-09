//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Ruchira Sahabandu  on 2023-02-17.
//

import Foundation

struct WeatherDataModel {
    let name: String
    let description: String
    let temp: Double
    let pressure: Int
    let humidity: Int
    let feelsLike: Double
    let visiblity: Int
    let windSpeed: Double
    let cloudPercentage: Int
    
    var formattedTemp: String {
        return String(format: "%.1f", temp)
    }
}
