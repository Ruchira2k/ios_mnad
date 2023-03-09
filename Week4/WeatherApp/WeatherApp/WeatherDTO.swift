//
//  WeatherDTO.swift
//  WeatherApp
//
//  Created by Ruchira Sahabandu  on 2023-02-17.
//

import Foundation

struct WeatherDTO: Decodable {
    let name: String
    let weather: [WeatherSummary]
    let main: MainWeatherData
    let visibility: Int
    let wind: WindData
    let clouds: CloudsData
}

struct WeatherSummary: Decodable {
    let description: String
}

struct MainWeatherData: Decodable {
    let temp: Double
    let pressure: Int
    let humidity: Int
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case pressure
        case humidity
        case feelsLike = "feels_like" // To decode a key which doesnt conform to Swift var declaration style (camelCase used in our example)
    }
}

struct WindData: Decodable {
    let speed: Double
}

struct CloudsData: Decodable {
    let all: Int
}
